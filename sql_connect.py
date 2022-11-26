
from tkinter import *
import tkinter.messagebox as messagebox
import mysql.connector as mysql

def insert():
    id=e_customerID.get();
    name=e_fullname.get();
    mobile=e_mobile.get();
    address=e_address.get();
    email=e_email.get();
    if(id==''or name=='' or mobile == '' or address=='' or email==''):
        messagebox.showinfo("insert status","all fields are required")
    else:
        con=mysql.connect(host="localhost",user="root",password="",database="inve")
        cursor=con.cursor()
        cursor.execute("insert into customer values(' "+ id +" ' ,' "+ name +" ',' "+ email +" ','"+ mobile +" ',' "+ address +" ')")
        cursor.execute("commit");
        messagebox.showinfo("insert status","inserted succesfully");
        con.close();
def delete():
    if(e_customerID.get()==''):
        messagebox.showinfo("insert status","deleted succesfully");
    else:
        con=mysql.connect(host="localhost",user="root",password="",database="inve")
        cursor=con.cursor()
        cursor.execute("delete from customer where customerID='"+ e_customerID.get()+"'");
        cursor.execute("commit");
        
        e_customerID.delete(0,'end')
        e_fullname.delete(0,'end')
        e_mobile.delete(0,'end')
        e_address.delete(0,'end')
        e_email.delete(0,'end')
        show()
        messagebox.showinfo("delete status","delete succesfully");
        con.close();
def update():
    id=e_customerID.get();
    name=e_fullname.get();
    mobile=e_mobile.get();
    address=e_address.get();
    email=e_email.get();
    if(id==''or name=='' or mobile == ''):
        messagebox.showinfo("update status","all fields are required")
    else:
        con=mysql.connect(host="localhost",user="root",password="",database="inve")
        cursor=con.cursor()
        cursor.execute("update customer set fullname='"+name+"' where customerID='"+id+" ' ")
        cursor.execute("commit");
        e_customerID.delete(0,'end')
        e_fullname.delete(0,'end')
        e_mobile.delete(0,'end')
        e_address.delete(0,'end')
        e_email.delete(0,'end')
        show()
        messagebox.showinfo("update status","update succesfully");
        con.close();

def get():
    if(e_customerID.get()==''):
        messagebox.showinfo("fetch status","fetched succesfully");
    else:
        con=mysql.connect(host="localhost",user="root",password="",database="inve")
        cursor=con.cursor()
        cursor.execute("select * from customer where customerID= '"+e_customerID.get()+"'")
        rows=cursor.fetchall()

        for row in rows:
            #e_customerID.insert(0,row[0])
            e_fullname.insert(0,row[1])
            e_mobile.insert(0,row[2])
            e_address.insert(0,row[3])
            e_email.insert(0,row[4])

        con.close();

def show():
     con=mysql.connect(host="localhost",user="root",password="",database="inve")
     cursor=con.cursor()
     cursor.execute("select * from customer ")
     rows=cursor.fetchall()
     list.delete(0, list.size())

     for row in rows:
        insertData= str(row[0])+'          '+row[1]  + '       '+str(row[3]) + '      ' + row[4] +'      '+row[2]
        list.insert(list.size()+1,insertData)
    



root = Tk()
root.geometry("1000x500")
root.title("Python+tkinter+Mysql")

customerID = Label(root,text='enter customerID',font=('bold',10))
customerID.place(x=20,y=30)

fullname = Label(root,text='enter fullname',font=('bold',10))
fullname.place(x=20,y=60)

mobile = Label(root,text='enter mobile',font=('bold',10))
mobile.place(x=20,y=90)

address=Label(root,text='enter address',font=('bold',10))
address.place(x=20,y=120)

email=Label(root,text='enter email',font=('bold',10))
email.place(x=20,y=150)

e_customerID=Entry()
e_customerID.place(x=150,y=30)

e_fullname=Entry()
e_fullname.place(x=150,y=60)

e_mobile=Entry()
e_mobile.place(x=150,y=90)

e_address=Entry()
e_address.place(x=150,y=120)

e_email=Entry()
e_email.place(x=150,y=150)


insert=Button(root,text='insert',font=('italic',10),bg='white',command=insert)
insert.place(x=20,y=180)

delete=Button(root,text='delete',font=('italic',10),bg='white',command=delete)
delete.place(x=70,y=180)

update=Button(root,text='update',font=('italic',10),bg='white',command=update)
update.place(x=130,y=180)

get=Button(root,text='get',font=('italic',10),bg='white',command=get)
get.place(x=190,y=180)

list=Listbox(root,height=30,width=80)
list.place(x=350,y=200)
show()

root.mainloop()














