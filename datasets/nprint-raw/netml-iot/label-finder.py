from os import listdir
from os.path import isfile, join

f = open("dataset-small/metadata.csv", "r")

labels = []

for x in f:
    a = x.split(",")
    a = a[1].split("\n")
    if a[0] not in labels:

        labels.append(a[0])

print(labels)       


