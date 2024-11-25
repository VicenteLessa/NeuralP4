['malware_pua', 'benign_benign', 'malware_htbot', 'malware_magichound', 'malware_downware', 'malware_ursnif', 'malware_emotet', 'malware_ramnit', 'malware_tinba', 
'bengin_benign', 'malware_cobalt', 'malware_minertrojan', 'malware_trickster', 'malware_dridex', 'malware_adload', 'benign_benign7', 'malware_ccleaner', 'malware_bitcoinminer', 
'malware_trickbot', 'malware_trojandownloader', 'malware_artemis']

benign = ['bengin_benign', 'benign_benign', 'benign_benign7']


path = "dataset-small/"

f = open(path + "metadata.csv", "r")
g = open(path + "metadata-2-classes.csv", "w")

labels = []

for x in f:
    a = x.split(",")    
    b = a[1].split("\n")
    if b[0] in benign:

        g.write(a[0] + ',' + 'benign' + '\n')
    else: 
        g.write(a[0] + ',' + 'malware' + '\n')

print(labels)       
