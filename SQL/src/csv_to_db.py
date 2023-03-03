# cada arquivo fserá carregado em uma tabela dentro do DB olist, cada tabela possui o nome tal igual ao arquivo , porém sem o .csv no final

import os
import pandas as pd
from sqlalchemy import create_engine


directory = "/home/luigi/desafios/Olist/data"
files = os.listdir(directory)

names = []
for file in files:
    caminho_completo = os.path.join(directory, file)
    if os.path.isfile(caminho_completo) and file.endswith(".csv"):
        names.append(file)

# Criar uma conexão com o banco de dados MySQL
engine = create_engine('mysql+pymysql://root:heilhydra@127.0.0.1:3306/olist')

for name in names:
    print(f'convertendo {name[:-12]}')
    # .csv to DataFrame
    df = pd.read_csv(os.path.join(directory, name))
    # DataFrame to DB
    df.to_sql(name=name[:-12], con=engine, if_exists='replace', index=False)

