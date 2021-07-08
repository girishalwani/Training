class Employee():
    def __init__(self,Empid, Ename,Sal,Deptno):
        self.Empid = Empid
        self.Ename = Ename
        self.Sal = Sal
        self.Deptno = Deptno
    def set_Empid(self,Empid):
        self.Empid = Empid
    def set_Ename(self,Ename):
        self.Ename =Ename
    def set_Sal(self,Sal):
        self.Sal=Sal
    def set_Deptno(self,Deptno):
        self.Deptno = Deptno
    def get_Ename(self):
        return self.Ename
    def get_Empid(self):
        return self.Empid
    def get_Sal(self):
        return self.Sal
    def get_Deptno(self):
        return self.Deptno
    def __str__(self):
        emp_list=[]                          
        emp_list.append(self.Empid)   #Appending data to list for writing to files
        emp_list.append(self.Ename)
        emp_list.append(self.Sal)
        emp_list.append(self.Deptno)
        return str(emp_list)         #Returns employee object with given ID,name,salary and department number
def main():
    menu()
    choice =(input('Enter your choice'))
    print('   ')
    if choice == '1':
        Add_Emp()
    elif choice == '2':
        Display_Emp()
    elif choice == '3':
        Separate_Data()
    elif choice == '4':
        print ("The program would quit now...")
        exit()
    else:
        print("Please choose appropriate option")
        main()
            

def Display_Emp():     #Function to dispaly employee details from file
    print("Choose one of the options a or b:\na)Display all employees\nb)Enter employee ID to display specific record\nc)Go back to main menu\n")
    count=0
    option=input()
    if option=='a':
        with open('emp.txt', 'r') as f:
            print("  Empid   Ename   Sal   Deptno")
            print(f.read()+'\n')
            Display_Emp()
    elif option=='b':
        print("Enter Employee ID")
        eid=(input())
        with open ('emp.txt', 'rt') as myfile:
            for myline in myfile:
                check(eid)
                if eid in myline:
                    print("  Empid   Ename   Sal   Deptno")
                    print(myline)
                    print(' ')
                    Display_Emp()
                    count=count+1
        if count==0:
            print("Employee ID does not exist")
            print(' ')
            Display_Emp()
    elif option=='c':
        main()
    else:
        print("Please choose appropriate option")
        print(' ')
        Display_Emp()

def Add_Emp():    #Function to add employee details to file
    emp_list=[]
    Empid =(input("Enter employee id"))
    check(Empid)          #calling check function to verify the authenticity of employee id format
    with open ('emp.txt', 'rt') as myfile:
            for myline in myfile:
                if Empid in myline:
                    print("Employee ID already exists,please add new employee")
                    print(' ')
                    Add_Emp()
    Ename = input("Enter employee name").upper()
    Sal =(input("Enter Salary"))
    if (int)(Sal)<=3000:
        print("Please enter salary more than 3000")
        print(' ')
        Add_Emp()      
    Deptno =input("Enter Department number")
    if Deptno!='10'and Deptno!='20' and Deptno!='30':
        print("Please enter Department number as 10 20 or 30")
        print(' ')
        Add_Emp()      
    entry=Employee(Empid, Ename,Sal,Deptno) #calling employee class definitions to load data
    emp_list=entry
    emp = open("emp.txt","a")
    emp.writelines('\n'+str(emp_list))  #Writing appended employee list to file 
    emp.close()
    print (Empid, "has been successfully added")
    print(' ')
    again = input("Do you want to add one more employee?(y/n)")
    if again== 'y':
        Add_Emp()
    else:
        main()

def check(Empid):    #Function to check valid employee id to be added or to be displayed
    try:
        try:
            (int)(Empid)
        except ValueError as e:
            raise ValueError('Please enter 3 digit employee id')
    except ValueError as err:                 #Raise exception for non numeric value of employee id
        print (err)
        print('                 ')
        main()
    s=str(Empid)
    if len(s)<3 or s[0]=='0':                #Check for 3 digit employee number
        print("Please enter 3 digit employee id")
        print('                 ')
        main()

def Separate_Data():   #Function to separate data department wise
    count=0;
    with open ('emp.txt', 'rt') as myfile:
        for myline in myfile:
            if '10' in myline:
                emp=open("emp_10.txt","a")
                emp.writelines('\n'+myline)  #Write data of employees from department number 10 to file emp_10.txt and accordingly to 20 & 30 in following conditions
                emp.close()
                count=count+1
            elif '20' in myline:
                emp=open("emp_20.txt","a")
                emp.writelines('\n'+myline)  
                emp.close()
                count=count+1
            elif '30' in myline:
                emp=open("emp_30.txt","a")
                emp.writelines('\n'+myline+'\n') 
                emp.close()
                count=count+1
    if count==0:
        print("There are no records to separate data department wise")
        print(" ")
        main()
    else:
        print("Data is successfully separated department wise into 3 different text files")
        print(" ")
        main()
        

       
def menu():
    print ('Choose one of the Options below')
    print (' ')
    print ("Add New Employee Details = 1")
    print ('Display Employee Details = 2')
    print ('Separate Employee Data Department wise= 3')
    print ('Exit the program = 4')
    print (' ') 

main()
