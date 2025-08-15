Flutter E-commerce Application
📖 Overview
This is a modern, cross-platform e-commerce mobile application built using Flutter and Dart. The project is designed with a focus on clean architecture, scalability, and maintainability. It Developed with the BLoC and Cubit patterns for robust state management, features a library of custom widgets for a consistent and beautiful UI, and uses a named routing strategy for clear and decoupled navigation.
The application provides a seamless shopping experience, allowing users to browse products, manage their cart, and proceed with orders on both Android and iOS devices.

🏗️ Architecture
The application follows the BLoC (Business Logic Component) architecture, which separates the presentation layer from the business logic, making the app easier to test, maintain, and scale.

Architecture Diagram (Mobile Flow)
[UI Layer (Widgets)] <--- (States) --- [BLoC/Cubit Layer] --- (Events/Functions) ---> [UI Layer (Widgets)]
        |                                       |
        | (User Interactions)                   | (Data Requests)
        v                                       v
[------------------- Repository Layer (Abstract Data Access) --------------------]
                                |
                                | (API Calls / DB Queries)
                                v
[------------------- Data Provider Layer (API Client / Local DB) ----------------]
        |                                       |
        v                                       v
[RESTful API Endpoints]                     [Local Storage (Shared Preference)]

API Endpoints Used
The application interacts with a RESTful backend through the following primary 
Base Url: https://qliq-server-production.up.railway.app
endpoints:
Method
Endpoint
Description
POST
/api/auth/register
Create a new user account.
POST
/api/auth/login
Authenticate a user and get a token.
GET
/api/products
Fetch a list of all products.
GET
/api/products?cat={id}
Fetch products by category.
GET
/api/products/{id}
Get details for a single product.
GET
/api/cart
Retrieve the contents of the user's cart.
POST
/api/cart
Add an item to the cart.
PUT
/api/cart/{itemId}
Update the quantity of an item in the cart.
DELETE
/api/cart/{itemId}
Remove an item from the cart.
POST
/api/orders
Place a new order from the cart.
GET
/api/orders
Get the user's order history.

🚀 Getting Started
Follow these instructions to get the project up and running on your local machine for development and testing.
Prerequisites
Flutter SDK (version 3.x.x or higher)
Dart SDK
Android Studio or Visual Studio Code
An active Android Emulator or a physical iOS/Android device
Setup & Run Instructions
Clone the repository to your local machine:
git clone https://github.com/your-username/your-repo-name.git

Navigate into the project directory:
https://github.com/QLIQ-HACKATHON/navaskt

Install the required dependencies:
flutter pub get

Run the application on your connected emulator or device:
flutter run

CONTACT
This project was developed by Mohammed Navas K T. For any questions, feedback, or follow-up, please feel free to reach out.

Contact Number: +971 50 230 1338
Email: navaskt38@gmail.com
LinkedIn: https://www.linkedin.com/in/mohammednavaskt/
Portfolio: https://mohammed-navas-kt-vgcshfy.gamma.site/




