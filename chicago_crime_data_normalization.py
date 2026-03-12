import pandas as pd

def read_chicago_crime_data_xls(file_path):
    df = pd.read_excel(file_path)
    crime_type = set(df['FBICODE'])    
    return crime_type

def prepare_csv(crime_type_list, file_path_csv):
    with open(file_path_csv, 'w') as file:
        file.write('FBI_CODE\n')
        for crime_type in crime_type_list:
            file.write(str(crime_type)+'\n')
    

file_path_xls = 'D:/CSV-Files/chicago_city_crime_analytics/ChicagoCrimeData_Xlsx..xlsx'
crime_type_list = read_chicago_crime_data_xls(file_path_xls)

file_path_csv = 'D:/CSV-Files/chicago_city_crime_analytics/fbi_code_types.csv'
prepare_csv(crime_type_list, file_path_csv)