# HealthCart

**HealthCart** is a web application where both vendors and customers can log in. Vendors can add medical products, and customers can purchase these products and make payments securely using Razorpay.

## Features

- **Vendor Login**: Vendors can log in and manage their medical products by adding new items or updating existing ones.
- **Customer Login**: Customers can browse the medical products available on the site and make purchases.
- **Secure Payment**: Customers can pay for their purchases using Razorpay for secure transactions.
- **Product Management**: Vendors can add, update, and remove products.

## Technologies Used

- **Frontend**:
  - JSP (Java Server Pages)
  - HTML5
  - CSS3
  - JavaScript
- **Backend**:
  - Java (Servlets and JSP)
  - MySQL (Database)
- **Tools**:
  - NetBeans IDE
  - XAMPP (for MySQL,Apache Tomcat Server )
- **Payment Gateway**:
  - Razorpay API

## Project Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Afrinaf/HealthCart.git
   ```
   
2. Import the project into NetBeans IDE.

3. Set up the database:
   - Start **XAMPP** and run **MySQL**.
   - Create a database named `healthcart` in MySQL.
   - Import the provided SQL file (`durgdatabase.sql`) to set up the necessary tables.
   
4. Update the database configuration in the project:
   - Navigate to the project files and update the database connection details (username, password) in the JSP files or configuration file.

5. Start the Apache Tomcat Server:
   - Run the project on **NetBeans** using the **Apache Tomcat Server**.

6. Access the application:
   - Open your browser and navigate to `http://localhost:8080/HealthCart/` to view the application.

## How to Use

1. **Vendor Login**:
   - Vendors can log in with their credentials and add, update, or delete medical products.

2. **Customer Login**:
   - Customers can create an account, log in, browse products, add items to the cart, and proceed with the checkout process.

3. **Payment**:
   - On the checkout page, customers can securely pay using Razorpay.

## Screenshots
![Screenshot (317)](https://github.com/user-attachments/assets/1023295d-24fe-4798-a148-b2b8541ce78e)
![Screenshot (316)](https://github.com/user-attachments/assets/13e9ad97-2aa4-4b21-9e47-40b3b8d59e18)
![Screenshot (315)](https://github.com/user-attachments/assets/3b18dc9a-2a20-4343-a482-9dfb72fb039d)
![Screenshot (314)](https://github.com/user-attachments/assets/53185118-8035-4010-8392-3e7d89c4b177)
![Screenshot (313)](https://github.com/user-attachments/assets/a89db6be-81be-48b3-a42e-b8bbfb5205e5)
![Screenshot (311)](https://github.com/user-attachments/assets/8d01725b-200a-43b5-b061-62b11761065d)

## License

This project is licensed under the MIT License 

