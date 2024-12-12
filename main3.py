from tkinter import *
from tkinter import messagebox
import mysql.connector
from tkinter import ttk
import datetime

# Connect to the MySQL database
db_connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="299792458sS@",
    database="testdb"
)


def submit_form():
    # All Entries Captured
    stock_name = stock_entry.get()
    stock_details = stock_details_entry.get()
    stock_qty = qty_entry.get()
    received_from = rcvd_entry.get()
    issued_to = issuedTo_entry.get()
    date_purchase = purchaseYr_entry.get()
    invoice_num = invoice_number.get()
    purchase_price = price.get()
    warranty = warranty_var.get()
    working = working_var.get()

  
    
    # Validation
    if not stock_name or not stock_qty:
        messagebox.showerror("Input Error", "Please fill out Name and Mobile Number.")
        return
    else:
        try:
            cursor = db_connection.cursor()
            sql = "INSERT INTO stockRegister (stock_name, stock_details, stock_qty, received_from, issued_to, date_purchase, warranty, working,purchase_price,invoice_num) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            val = (stock_name, stock_details, stock_qty, received_from, issued_to, date_purchase, warranty, working,purchase_price,invoice_num)
            cursor.execute(sql, val)
            db_connection.commit()
        except mysql.connector.Error as error:
          print(f"Error: {error}")
          db_connection.rollback()
    
        finally :
          # Close the connection
          print(f"Data Inserted: {cursor.lastrowid}")
          cursor.close()


def search_stock():
       # All Entries Captured
    stock_name1 = stock_entry.get()
    print(stock_name1)
    try:
       cursor = db_connection.cursor()

        # Build SQL query dynamically
       sql = "SELECT * FROM stockRegister WHERE 1=1"
       if stock_name1:
            sql += f" AND stock_name LIKE '%{stock_name1}%'"
       
        # Execute the query
       cursor.execute(sql)
       myresult = cursor.fetchall()
    
        # Prepare results for display
       if not myresult:
            messagebox.showinfo("No Results", "No matching records found.")
       else:
            user_info = "\n".join(
                f"Stock name: {x[0]}, Details: {x[1]}, Qty: {x[2]}, Rcvd From: {x[3]}, Issued to: {x[4]}"
                for x in myresult
            )
            messagebox.showinfo("Search Results", user_info)

  
    except mysql.connector.Error as error:
        print(f"Error: {error}")
        db_connection.rollback()
    
    finally :
        cursor.close() 

window = Tk()
window.geometry("500x500")
window.resizable(False,False)
window.title("Mentors Eduserv")
window.config(bg="black")


#Set Window Icon
try: 
  p1 = PhotoImage(file='Logo.jpg')
  window.iconphoto(False,p1)
except TclError:
  print("MElogo.png not found. Ensure the file is in the same directory.")

#Creates a Border Around
# Inner frame (acts as the main content area)
inner_frame = Frame(window, bg="lightblue", bd=0)
inner_frame.place(relx=0.01, rely=0.01, relwidth=0.98, relheight=0.98)  # Adjusted to leave a border around it

title_bar = Frame(inner_frame, relief="raised", bd=0)
title_bar.grid(row=0,column=0,columnspan=4,sticky="EW",padx=5,pady=5)

title_label = Label(title_bar, text="Stock & Inventory", bg="black",fg="white",anchor="center",font=("Arial",10,"bold"))
title_label.grid(row=0,column=2,columnspan=2,sticky="EW",pady=5,padx=15)
# Configure column weights for the main window
window.grid_columnconfigure(0, weight=1)
window.grid_columnconfigure(1, weight=1)
window.grid_columnconfigure(2, weight=1)
window.grid_columnconfigure(3, weight=1)

# Employee Details Section - Row 1
stock_details = Label(inner_frame,text="Stock Details Register",bg="yellow",font=("Arial",12))
stock_details.grid(row=1,column=0,columnspan=2,pady=10)

# Stock Name Entry - Row 2
stock_name = Label(inner_frame,text="Stock Name:",bg="lightblue", font=("Arial",10))
stock_name.grid(row=2,column=0,sticky="e",padx=5,pady=5)
stock_entry = Entry(inner_frame,width=30)
stock_entry.grid(row=2,column=1,sticky="w",padx=5,pady=5)

# Search Stock Details Button - Row 2
search_button = Button(inner_frame, text="Search", bg="darkgreen", fg="white", font=("Arial", 10),command=search_stock)
search_button.grid(row=2, column=2, sticky="W",pady=20,padx=5)

# Stock Details Entry - Row 3
stock_details = Label(inner_frame,text="Details:",bg="lightblue", font=("Arial",10))
stock_details.grid(row=3,column=0,sticky="e",padx=5,pady=5)
stock_details_entry = Entry(inner_frame,width=30)
stock_details_entry.grid(row=3,column=1,columnspan=2,sticky="ew",padx=5,pady=5)

# Quantity Entry - Row 4
qty_label= Label(inner_frame,text="Quantity:",bg="lightblue", font=("Arial",10))
qty_label.grid(row=4,column=0,sticky="e",padx=5,pady=5)
qty_entry = Entry(inner_frame,width=5)
qty_entry.grid(row=4,column=1,sticky="ew",padx=5,pady=5)

# Received Entry - Row 5
rcvd_label = Label(inner_frame,text="Received From:",bg="lightblue", font=("Arial",10))
rcvd_label.grid(row=5,column=0,sticky="e",padx=5,pady=5)
rcvd_entry = Entry(inner_frame,width=5)
rcvd_entry.grid(row=5,column=1,sticky="ew",padx=5,pady=5)

# Issued To Entry - Row 6
issuedTo_label = Label(inner_frame,text="Issued To:",bg="lightblue", font=("Arial",10))
issuedTo_label.grid(row=6,column=0,sticky="e",padx=5,pady=5)
issuedTo_entry =  Entry(inner_frame,width=5)
issuedTo_entry.grid(row=6,column=1,sticky="ew",padx=5,pady=5)

# Date of Purchase - Row 7
purchase_date_label = Label(inner_frame,text="Date of Purchase:",bg="lightblue", font=("Arial",10))
purchase_date_label.grid(row=7,column=0,sticky="e",padx=5,pady=5)
purchaseYr_entry = Entry(inner_frame,width=1)
purchaseYr_entry.grid(row=7,column=1,sticky="ew",padx=5,pady=5)

# Invoice Number - Row 8
invoice_label = Label(inner_frame,text="Invoice Number:",bg="lightblue", font=("Arial",10))
invoice_label.grid(row=8,column=0,sticky="e",padx=5,pady=5)
invoice_number = Entry(inner_frame,width=1)
invoice_number.grid(row=8,column=1,sticky="ew",padx=5,pady=5)

# Purchase Price - Row 9
purchase_price_label = Label(inner_frame,text="Purchase Price:",bg="lightblue", font=("Arial",10))
purchase_price_label.grid(row=9,column=0,sticky="e",padx=5,pady=5)
price = Entry(inner_frame,width=1)
price.grid(row=9,column=1,sticky="ew",padx=5,pady=5)

# Warranty - Row 10
warranty_label = Label(inner_frame,text="Under Warranty:",bg="lightblue", font=("Arial",10))
warranty_label.grid(row=10,column=0,sticky="e",padx=5,pady=5)
warranty_var = BooleanVar(inner_frame,value=True)  # Holds the selected gender value
answer_yes = Radiobutton(inner_frame, text="yes", variable=warranty_var, value=True, bg="white")
answer_yes.grid(row=10, column=1, sticky="e", padx=5)
answer_no = Radiobutton(inner_frame, text="No", variable=warranty_var, value=False, bg="white")
answer_no.grid(row=10, column=1, sticky="w", padx=5)

# Working Condition - Row 11
working_label = Label(inner_frame,text="Is it Working:",bg="lightblue", font=("Arial",10))
working_label.grid(row=11,column=0,sticky="e",padx=5,pady=5)
working_var = BooleanVar(inner_frame,value=True)  # Holds the selected gender value
working_yes = Radiobutton(inner_frame, text="yes", variable=working_var, value=True, bg="white")
working_yes.grid(row=11, column=1, sticky="e", padx=5)
working_no = Radiobutton(inner_frame, text="No", variable=working_var, value=False, bg="white")
working_no.grid(row=11, column=1, sticky="w", padx=5)

# Submit Button - Row 12
submit_button = Button(inner_frame, text="Submit Details", bg="darkgreen", fg="white", font=("Arial", 10),command=submit_form)
submit_button.grid(row=12, column=1, sticky="EW",pady=20,padx=5)

window.mainloop()
