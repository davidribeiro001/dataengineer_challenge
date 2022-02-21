# Distance Calculator By David Ribeiro
# For this code to work , save the trips.csv file in the folder C:\Python
import pandas as pd
import geopy as geo 
from geopy import distance
from pandas import read_csv
from dataframe_sql import register_temp_table , query
# Import File (In the real solution the file would be stored in a Azure Datalake Blob Storage)
df = pd.read_csv ('trips.csv')
# Data Cleansing 
df['origin_coord'] = df['origin_coord'].str.replace('POINT','')
df['destination_coord'] = df['destination_coord'].str.replace('POINT', '')
df['origin_coord'] = df['origin_coord'].str.replace('(','')
df['origin_coord'] = df['origin_coord'].str.replace(')','')
df['destination_coord'] = df['destination_coord'].str.replace('(','')
df['destination_coord'] = df['destination_coord'].str.replace(')','')
df['destination_coord'] = df['destination_coord'].str.lstrip()
df['origin_coord'] = df['origin_coord'].str.lstrip()
df['origin_coord'] = df['origin_coord'].str.replace(' ',' , ',1)
df['destination_coord'] = df['destination_coord'].str.replace(' ',' , ',1)
df['Distance'] = pd.NaT

for i in range(0,len(df)):
    point1 = ( df.iloc[i]['origin_coord'])
    point2 = ( df.iloc[i]['destination_coord'])
    df.loc[i]=(df.iloc[i]['region'],df.iloc[i]['origin_coord'] ,df.iloc[i]['destination_coord'],df.iloc[i]['datetime'] , df.iloc[i]['datasource'] ,distance.distance(point1 , point2).km )


#Export File
df.to_csv (r'C:\Python\File3.csv', index = None, header=True) 
print(df)



 