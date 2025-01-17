import React, { useState } from 'react';
import './assets/style/App.css'
import './assets/style/main.css'
import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom';

// import { HashRouter as Router, Route, Routes } from 'react-router-dom';

//Managements
import DistributerDetails from './components/pages/Distributer_Detials.jsx';
import Products from './components/pages/Products.jsx';
import AddUserDetails from './components/pages/Add_User_Detials';
import EditDistributerDetails from './components/pages/Edit_Distributer_Detials';
import CustomerDetails from './components/pages/CustomerDetails';
import Add_Customer_Detials from './components/pages/Add_Customer_Detials';
import Add_site from './components/pages/Add_Products.jsx';
import Invoice from "./components/invoice_component/Invoice.jsx";
import InvoiceGenerator from ".//components/pages/InvoiceGenerator.jsx";
import ProfilePage from "./components/pages/ProfilePage.jsx";
import TransactionHistory from "./components/pages/TransactionHistory.jsx";

// Main Content Template
import Sidebar from './components/layout/Sidebar.jsx';
import Login from './components/pages/Login';
import TopNavbar from './components/layout/TopNavbar.jsx';
import UpdatePassword from './components/pages/UpdatePassword.jsx';
import StaffDetails from './components/pages/Staff_Detials.jsx';
import AddProducts from './components/pages/Add_Products.jsx';
import EditProduct from './components/pages/EditProduct.jsx';
import FeedbackForm from './components/pages/FeedbackForm.jsx';
import { API_URL_CLIENT } from './config/config.js';

import Order_Management from './components/pages/Order_Management';


// jwt decode token 
import { decodeToken } from './config/decode_jwt.js';



const App = () => {
  const handleLogout = () => {
    sessionStorage.removeItem('userType');
    sessionStorage.removeItem('session_dbName');
    sessionStorage.removeItem('access_control');
    sessionStorage.removeItem('state_count');
  };
  // const userInfo1 = {
  //   customer: "0",
  //   distributer: "3",
  //   staff: "2",
  //   email: "admin@gmail.com",
  //   invoice: "3",
  //   isLoggedIn: true,
  //   name: "admin",
  //   phno: "123456789",
  //   position: "Manufacturer",
  //   product: "3",
  //   userid: "123",
  //   userprofile: "1"
  // };
  const jwt_token = sessionStorage.getItem("token");
  let userInfo = [];
  if (jwt_token) {
    const decode_data = decodeToken(jwt_token);
    userInfo = decode_data.userId;
    console.log("access controll");
    console.log(userInfo);  
  }
  
  const currentLoc = window.location.href;
console.log("window location href");
console.log(window.location.href);

  return (
    <BrowserRouter>
      {/* {(window.location.href !== `${API_URL_CLIENT}` && jwt_token) ? ( */}
      <Routes>
        <Route path='/' element={<Login />} />
        <Route path='UpdatePassword' element={<UpdatePassword />} />
      </Routes>
      {(window.location.href !== `${API_URL_CLIENT}` && jwt_token) &&(
        <div>
          <TopNavbar />
          <Sidebar handleLogout={handleLogout} />
          
          {userInfo.staff > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* Staff module */}
                <Route path='/Staff_Details' element={<StaffDetails position={4} Positionid_val={4} />} />
                <Route path='/Staff_Details/Edit_Staff_Details/:useridEnc' element={<EditDistributerDetails Positionid_val={4} />} />
                <Route path='/Staff_Details/Add_User_Details' element={<AddUserDetails Positionid_val={4} />} />
              </Routes>
            </div>
          )}

          {userInfo.distributer > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* Distributer module */}
                <Route path='/Distributer_Details' element={<StaffDetails position={2} Positionid_val={2} />} />
                <Route path='/Distributer_Details/Edit_Distributer_Details/:useridEnc' element={<EditDistributerDetails Positionid_val={2} />} />
                <Route path='/Distributer_Details/Add_User_Details' element={<AddUserDetails Positionid_val={2} />} />
              </Routes>
            </div>
          )}

          {userInfo.d_staff > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* D_Staff_Detials module */}
                <Route path='/D_Staff_Details' element={<StaffDetails position={5} Positionid_val={5} />} />
                <Route path='/D_Staff_Details/Edit_D_Staff_Details/:useridEnc' element={<EditDistributerDetails Positionid_val={5} />} />
                <Route path='/D_Staff_Details/Add_User_Details' element={<AddUserDetails Positionid_val={5} />} />
              </Routes>
            </div>
          )}

          {userInfo.customer > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* Customer module */}
                <Route path='/Customer_Details' element={<StaffDetails position={3} Positionid_val={3} />} />
                <Route path='/Customer_Details/Edit_Customer_Details/:useridEnc' element={<EditDistributerDetails Positionid_val={3} />} />
                <Route path='/Customer_Details/Add_User_Details' element={<AddUserDetails Positionid_val={3} />} />
                <Route path='/Order_Management' element={<Order_Management positionid={2} />} />
              </Routes>
            </div>
          )}

          {userInfo.product > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* Products Module */}
                <Route path='/Products' element={<Products />} />
                <Route path='/Products/Add_Products' element={<AddProducts />} />
                <Route path='/Products/Edit_Product_Details/:productid/:productBatch' element={<EditProduct />} />
              </Routes>
            </div>
          )}

          {userInfo.invoicegenerator > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* Invoice Module */}
                <Route path='InvoiceGenerator' element={<InvoiceGenerator />} />
              </Routes>
            </div>
          )}

          {userInfo.invoicepayslip > 0 && (
            <div style={{ marginLeft: '50px' }}>
              <Routes>
                {/* Invoice Module */}
                <Route path='TransactionHistory' element={<TransactionHistory />} />
              </Routes>
            </div>
          )}

          <Routes>
            <Route path='ProfilePage' element={<ProfilePage />} />
            <Route path='feedback' element={<FeedbackForm />} />
          </Routes>

        </div>
      )}
     
    </BrowserRouter>

  );

};


export default App;