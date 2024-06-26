import pandas as pd
from sqlalchemy import create_engine

DB_USER = 'root'
DB_PASS = 'Control123'
DB_NAME = 'ventas_medicamentos'
# docker tener cuidado
DB_HOST = 'localhost'

connection_string = f'mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}'
engine = create_engine(connection_string)

def cargar_datos_csv(tabla, archivo_csv):
    df = pd.read_csv(archivo_csv)
    df.to_sql(tabla, con=engine, if_exists='append', index=False)
    print(f'Datos cargados exitosamente en la tabla {tabla}')


cargar_datos_csv('dim_proveedores', './proveedores.csv')
cargar_datos_csv('dim_ubicaciones', './ubicaciones.csv')
cargar_datos_csv('dim_medicamentos', './medicamentos.csv')
cargar_datos_csv('dim_clientes', './clientes.csv')
cargar_datos_csv('dim_tiempo', './fecha.csv')
cargar_datos_csv('hechos_ventas', './ventas.csv')