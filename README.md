<h1 align="center">ExpressJS - SPACE RESTfull API</h1>

This is my first backend point of sale project, and will be used in one of my projects, the SPACE POS App. The purpose of this application is to make sales transactions easier, and also easy for anyone to use. Thank you, hopefully useful. [More about Express](https://en.wikipedia.org/wiki/Express.js)

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.12.13-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements

1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name #nama_database, and Import file sql to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:3001/)
8. You can see all the end point [here](#end-point)

## Set up .env file

Open .env file on your favorite code editor, and copy paste this code below :

```
DB_HOST=localhost // Database Host
DB_USER=root // Database Root
DB_PASS=// Database Password
DB_NAME=online_shop // Database Name

PORT=3001 //PORT
IP=127.0.0.1 // IP
```

## End Point

**1. GET**

- `/product`(Get All Product)
  - `{ "page": 1, "limit": 9, "sort": "product_price%20ASC"}`  
- `/product/:id`(Get Product By ID)
- `/product/search`(Get Product By Name)
  - `{ "keyword": "ice"}`
- `/category`(Get All Category)
  - `{ "page": 1, "limit": 9, "sort": "history_name%20ASC"}`  
- `/category/:id`(Get Category By ID)
- `/history`(Get All History)
- `/history/:id`(Get History By ID)
- `/order`(Get All Order)
- `/order/:id`(Get Order By ID)

**2. POST**

- `/product` (Post Product)
  - `{ "category_id": 2, "product_name": "Ice Cream", "product_harga": 25000, "product_image": "#", "product_status" : 1 | 0}`
- `/category` (Post Category)
  - `{ "category_name": Foods, "category_status": 1 | 0}`
- `/order` (Post Order)
  - `{ "orders": [{"product_id": 11, "order_qty": 3, "order_price": 5000}, {"product_id": 12, "order_qty": "order_price": 10000}] }`
- `/users/register` (Register New User)
  - `{ "user_email": "user@gmail.com", "user_password": "user112233", "user_name": "User"}`
- `/users/login` (Sign in)
  - `{ "user_email": "admin@gmail.com", "user_password": "12345678"}`
  
**3. PATCH**

- `/product/:id` (Update Product by id)
  - `{ "category_id": 2, "product_name": "Ice Cream", "product_harga": 25000, "product_image": "#", "product_status" : 1 | 0}`
- `/category/:id` (Update Category by id)
  - `{ "category_name": Foods, "category_status": 1 | 0}`
- `/users/:id` (Update Users Users Status by id)
  - `{ "user_email": "user@gmail.com", "user_password": "user112233", "user_name": "User", "user_status": 1}`
  
**4. DELETE**

- `/product/:id` (Delete Product by id)
- `/category/:id` (Delete Category by id)

**5. Documentation API**

https://web.postman.co/collections/12353337-9b876826-2dc7-4a89-af8e-295fda40512b?version=latest&workspace=e23183f9-0134-41bf-8a77-b51e1037f49e

# Play-Chat-Backend
