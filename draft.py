import os

def calcul_indice(path):
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
    print(liste_obj)



if __name__ == '__main__':

    calcul_indice("v4/train/baseline_sub_1_evolve5/labels/")

