from os import listdir
from os.path import isfile, join

path_complete = "dataset-complete/"
path_reduced = "dataset-small/"

onlyfiles = [f for f in listdir(path_reduced) if isfile(join(path_reduced, f))]
print(onlyfiles[:25])


f = open(path_complete + "metadata.csv", "r")
g = open(path_reduced + "metadata.csv", "w")

for x in f:
    a = x.split(",")
    if a[0] in onlyfiles:  
        g.write(x)

print(g)


