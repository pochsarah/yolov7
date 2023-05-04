import os
import numpy as np
from collections import Counter

def getListe(path):
    ###
    # Calcul d'un indice pour la sélection d'un certain nombre d'image
    #

    #les labels sont dans un dossier - une fichier par image avec dans ce fichier les coordonnées des bbx détectés
    # avec indice de confidence. 
    liste_files = os.listdir(path)
    liste_files.sort()

    #faire une liste avec tous les objets détectés + nom de l'image  
    # après calcule l'indice et sort() en fonction de ce nombre

    liste_obj = [] 

    for i in liste_files : 
        with open(path+i, "r")as f :
            liste_tmp = f.read().splitlines()
            liste_tmp = [it.split(" ") for it in liste_tmp]
        for elt in liste_tmp : 
            elt.append(i)
            liste_obj.append(elt)
    return liste_obj 


def takeConf(elem):
    return elem[5]


def maximum(liste, budget):
    # on suppose que la liste est au bon format - 6 col annotation + fichier - a cheker auparavant 
    # retourne la liste des images à ajouter 
    liste_img = []
    liste.sort(reverse=True, key=takeFile)
    for elt in liste : 
        if elt[6] not in liste_img and  len(liste_img) <= budget :
            liste_img.append(elt[6])
    return liste_img

def extract_lower(liste, budget): 
    liste_img = []
    liste.sort(key=takeFile)
    for elt in liste : 
        if elt[6] not in liste_img and  len(liste_img) <= budget :
            liste_img.append(elt[6])
    return liste_img

"""A low valuation effectively delays the selection of empty examples until there are either 
no better examples left or the model has improved enough to actually produce detections on them"""

def takeFile(elt):
    return elt[1]

def sum(liste, budget): 
    #dictionnaire avec chaque valeur de fichier
    liste_sum = []
    
    for elt in liste : 
        f = [it[0] for it in liste_sum]
        if elt[6] not in f : 
            liste_sum.append([elt[6], float(elt[5])])
        else :
            idx = f.index(elt[6])
            liste_sum[idx][1] += float(elt[5])
    liste_sum.sort(reverse=True, key=takeFile)
    pool = liste_sum[:budget]
    return [it[0] for it in pool]

def average(liste, budget):
    #pas hyper precis risques de décalage à améliorer
        counter = Counter([it[6] for it in liste])
        count = list(counter.values())
        name = list(counter.keys())
        somme = [0]*len(count)
        for it in liste : 
            idx = name.index(it[6])
            somme[idx] += float(it[5])
        av = [somme[i]/count[i] for i in range(len(count))]
        f = [[name[i], av[i]] for i in range(len(name))]
        f.sort(reverse=True, key=takeFile)
        pool = f[:budget]
        return [it[0] for it in pool]





if __name__ == '__main__':

    test = getListe("v5/test/final_baseline_subset1_evolved_linear_SGD2/labels/")
    liste = average(test, 5)
    print(liste)
    liste = sum(test, 5)
    print(liste)