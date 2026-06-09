smartschool = "smartschool_leerlingen.csv"
active_d = "ad_leerlingen.csv"
output = "output.csv"

#import pandas as pd
#df = pd.read_csv("smartschool_leerlingen.csv")
#print(df)

import csv
rows_smrtschl, rows_ad = [], []  # Column names
idx1, idx2 = 0,0

with open(smartschool, 'r') as csvfile:
    csvreader = csv.reader(csvfile)  # Reader object
    fields_smrtschl = next(csvreader)  # Read header
    headers = fields_smrtschl[0].split(';')
    rows_smrtschl.append(headers) 
    for row in csvreader:           # Read rows
        row = row[0].split(';') 
        rows_smrtschl.append(row)
    idx1 = headers.index('User principal name')
    
with open(active_d, 'r') as adfile:
    adreader = csv.reader(adfile)  # Reader object
    fields_ad = next(adreader)  # Read header
    for row in adreader:           # Read rows
        rows_ad.append(row)
        
new_csv = []
i = 0
for entry in rows_smrtschl:
    if not any(entry[idx1].replace('@sml.be', '') in j for j in rows_ad) or i == 0:  
        new_csv.append(entry)
    i += 1

with open(output, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(new_csv)


    #for row in csvreader:     # Read rows
    #    rows.append(row)

    #print("Total no. of rows: %d" % csvreader.line_num)  # Row count
    
    #print(fields.index("User principal name"))

#print('\nFirst 5 rows are:\n')
#for row in rows[:5]:
#    for col in row:
#        print("%10s" % col, end=" ")
#    print('\n')
#
