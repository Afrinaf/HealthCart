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
![Screenshot (317)](https://github.com/user-attachments/assets/ddffbf10-ed0b-43ac-bcea-340abe7d2f86)
![Screenshot (316)](https://github.com/user-attachments/assets/b702e2f9-f6f1-4987-b94d-93c69e8dc71a)
![Screenshot (315)](https://github.com/user-attachments/assets/31bebd8d-35ad-479e-a75e-65ee89389055)
![Screenshot (314)](https://github.com/user-attachments/assets/2787ce89-1111-4912-a80a-6a7798d97cad)
![Screenshot (313)](https://github.com/user-attachments/assets/5a2f3cba-6a00-4dfb-b760-6fdf8853b13e)
![Screenshot (311)](https://github.com/user-attachments/assets/fcbb3c4a-83bd-4201-a4c0-66fc332d7ec8)


## License

This project is licensed under the MIT License 

