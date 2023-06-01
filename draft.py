import os
import numpy as np
from collections import Counter
import yaml
import random

#---------------------------------------------------------------------------
def add_remove_images(path: str, liste_images: list): 
    """
    Remove the images from the test text file to the train text file

    Args: 
        path: Path of the data .yaml file (opt.data)
        liste_images: List of the images which go from the test dataset to the train dataset
    """
    with open(path) as f:
        data_dict = yaml.load(f, Loader=yaml.SafeLoader)
        liste = [data_dict['train'], data_dict['test']]

    with open(liste[0], "a+") as f:
        for it in liste_images: 
            f.write(it+"\n")

    with open(liste[1], 'r') as f:
        lines = f.read().splitlines()
        with open(liste[1], 'w') as f: 
            for l in lines:
                if l not in liste_images :
                    f.write(l+"\n")

def remove_cache(path: str):  
    """
    Remove the cache files created for the previous training. 

    Args: Path of the data .yaml file (opt.data)
    """  
    with open(path) as f:
        data_dict = yaml.load(f, Loader=yaml.SafeLoader)
        liste = [data_dict["train"], data_dict["val"], data_dict["test"]]
        liste = [it.replace("txt", "cache") for it in liste]
        for it in liste :
            if os.path.exists(it):
                os.remove(it)

def random_choice(path: str, budget: int):
    """
    Select randomly a define number of lines from a text file - test set 

    Args : 
        path : Path of data .yaml file (opt.data)
        budget : Number of line to be randomly selected
    
    Return : List of the selected lines
    """
    with open(path) as f:
        data_dict = yaml.load(f, Loader=yaml.SafeLoader)
        liste = data_dict['test']
    
    with open(liste, 'r') as f:
        liste = f.read().splitlines()
    return random.choices(liste, k=budget) 

def move_pool_random(path, budget):
    """
    Move a pool of images from the test dataset to the train dataset 

    Args: 
        path: Path of the data .yaml file (opt.data)
        budget: Number of images which will be moved
    """
    with open(path) as f:
        data_dict = yaml.load(f, Loader=yaml.SafeLoader)
        liste = [data_dict['train'], data_dict['test']]
    
    pool = random_choice(path, budget)

    add_remove_images(liste[0], liste[1], pool)

def margin_sampling_bin(p: float):
    """
    Calculation of the margin sampling utility score

    Args:
        p: Probability of having an item on the bounding box

    Return : Utility score
    """
    return (1 - abs(2*p-1))**2

def l_score_image(path: str):
    """
    Get the utility score for each detection in an image 

    Args: 
        path: Path of the image predicted label text file

    Return : List of all the utility scores for the image
    """
    liste_score = []

    with open(path, 'r') as f:
        detect = f.read().splitlines()
        detect = [it.split(" ") for it in detect]
    return [margin_sampling_bin(float(it[5])) for it in detect] 

def all_scores(path: str):
    """ 
    Get all the utility score for each image of the test set

    Args:
        path: Path of the folder containing the prediction text files

    Return: Dictionnary with key is name of image and 
            values list of utility score of the image 
    """ 
    images = os.listdir(path)
    dict_img = dict()
    for it in images : 
        dict_img[it] = l_score_image(path+it)
    return dict_img

def sum_scores(dict_img: dict):
    """
    Calculate the sum of the utility scores for a whole image. 

    Parameters
    ----------
    dict_img : dict
        keys are the path of the labels text file of an image and 
        values are the list of the utility score for all the dectections

    Returns
    -------
    dict_sum : dict
        keys are the path of the labels text fil of an image and 
        values are the sum of all the detections utility scores of the image.

    """
    dict_sum = dict()
    for it in dict_img.items():
        dict_sum[it[0]] = sum(it[1])
    return dict_sum

def avg_scores(dict_img: dict): 
    """
    Calculate the average of the utility scores for a whole image. 

    Parameters
    ----------
    dict_img : dict
        keys are the path of the labels text file of an image and 
        values are the list of the utility score for all the dectections

    Returns
    -------
    dict_avg : dict
        keys are the path of the labels text fil of an image and 
        values are the average of all the detections utility scores of the image.

    """
    dict_avg = dict()
    for it in dict_img.items():
        dict_avg[it[0]] = sum(it[1])/len(it[1])
    return dict_avg

def max_scores(dict_img: dict): 
    """
    Find the maximum utility score of the image. 

    Parameters
    ----------
    dict_img : dict
        keys are the path of the labels text file of an image and 
        values are the list of the utility score for all the dectections

    Returns
    -------
    dict_max : dict
        keys are the path of the labels text fil of an image and 
        values are the maximal  utility scores of the image.

    """
    dict_max = dict()
    for it in dict_img.items():
        dict_max[it[0]] = max(it[1])
    return dict_max

#---------------------------------------------------------------------------

def find_image(method: str, path: str):
    dict_img = all_scores(path)
    
    if method == "sum":
        dict_sc = sum_scores(dict_img)
    elif method == "average":
        dict_sc = avg_scores(dict_img)
    elif method == "maximum" : 
        dict_sc = max_scores(dict_img)
    else: 
        #raise error
        print("choose bewteen")
    return dict_sc
    #return max(dict_sc, key=dict_sc.get) #remplacer par la somme par chunk. 
    
def chunk_unlabelled(path, budget):
    with open(path) as f:
        data_dict = yaml.load(f, Loader=yaml.SafeLoader)
        liste = data_dict['test']

    with open(liste, 'r') as f:
        liste = f.read().splitlines()
    
    random.seed(42)
    random.shuffle(liste)  
    
    return [liste[i*budget:(i+1)*budget] for i in range((len(liste)+budget-1)//budget)]
 
def random_chunk(path_data, chunks):
    img = random_choice(path_data, 1)
    
    to_remove = 0
    for i in range(len(chunks)):
        if img[0] in chunks[i]:
            to_remove = i
    
    add_remove_images(path_data, chunks[to_remove])
    return to_remove
    

def select_chunk(path_label, path_data, method, chunks) :  
    dict_sc = find_image(method, path_label)
    liste_img = [[key.replace('txt', 'jpg'), value] for key, value in dict_sc.items()]
    sum_chunks = [0]*len(chunks)
    for it in liste_img:
        for i in range(len(chunks)):
            for j in range(len(chunks[i])):
                if it[0] in chunks[i][j]:
                    sum_chunks[i] += it[1]
    to_remove = np.argmax(sum_chunks)
    
    add_remove_images(path_data, chunks[to_remove])
    return to_remove 
 


if __name__ == '__main__':
    
    path = "C:/Users/sarah/Documents/Memoire/v5/test/final_baseline_subset1_custom_linear_SGD6/labels/"

    path_data = "./data/subset_1.yaml"

    chunks = chunk_unlabelled(path_data, 2)
    print(len(chunks))
    
    method = "sum"
    
    if method == "random":
        j = random_chunk(path_data, chunks)
    else: 
        j = select_chunk(path, path_data, method, chunks)
    
    
        
    print(j)
    print(chunks[j]) 
    chunks.remove(chunks[j])
    print(len(chunks))
        
    
