import mysql.connector
from mysql.connector import errorcode
import pandas as pd 
config = {
 'user':'root',
 'password':'15072005lL@',
 'host':'localhost',

}

try:
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    print("Ket noi den MySQL thanh cong !")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Ket noi khong thanh cong ! Loi nhap ten hoac password")
    else :
        print(err)
        
        
config['database'] = 'jewelry_store_db'
try:
    conn.database = config['database']
    print('Connector Database succesfully')
except mysql.connector.Error as err:
    print('Can not connect Database')
    print(err)


df = pd.read_excel('./data_temp/san_pham.xlsx')

def insert_data(df):
    soluong = len(df)
    SqlInsertData =( "insert into san_pham  ( id_san_pham , ma_san_pham , ten_san_pham , price , mo_ta , id_thuong_hieu , id_loai_san_pham , kich_co , trang_thai , ngay_tao, ngay_cap_nhat ) "
                        " values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
    for i in range(soluong):
        data = (df['id_san_pham'][i], df['ma_san_pham'][i], df['ten_san_pham'][i], df['price'][i], df['mo_ta'][i], df['id_thuong_hieu'][i], df['id_loai_san_pham'][i], df['kich_co'][i], df['trang_thai'][i], df['ngay_tao'][i], df['ngay_cap_nhat'][i])
        try : 
            cursor.execute(SqlInsertData, data)
            conn.commit()
            print(" Tai du lieu thanh cong !")
        except mysql.connector.Error as err:
            print("Loi tai du lieu !")
            print(err)
            conn.rollback()
        