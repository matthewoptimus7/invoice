import React, { useState } from 'react';
import companyLogo from '../../assets/logo/invoiceLogo.png';
import { Avatar, Badge, Button, Chip, Drawer, IconButton } from '@mui/material';
import MenuIcon from '@mui/icons-material/Menu'
import { lightBlue } from '@mui/material/colors';
import { useNavigate } from 'react-router-dom';


// jwt decode token 
import { decodeToken } from '../../config/decode_jwt';


const TopNavbar = () => {


  const [isSidebarOpen, setisSidebarOpen] = useState(false);
  const handleSidebarToggle = () => {
    setisSidebarOpen(!isSidebarOpen);
  }
  const userInfoString = sessionStorage.getItem("token");
  const userInfo = decodeToken(userInfoString).userId;
  // console.log(userInfo.email);
  const navigate = useNavigate();

  const navigateProfileInfo = () =>{
    navigate('/ProfilePage')
  }
  return (
    <nav className='top-nav flex-class align-center'>
      {/* Product Logo */}
      <div className='navbar_mar mar-left d-flex'>
      <div style={{
    display: "flex",
    alignItems: "center",
    justifyContent: "space-between",
    padding: "10px 20px",
    backgroundColor: "#f8f9fa",
    boxShadow: "0 2px 4px rgba(0, 0, 0, 0.1)"
}}>
  <div style={{ display: "flex", alignItems: "center" }}>
    <img 
      src={companyLogo} 
      alt="Logo" 
      style={{ height: "40px", marginRight: "10px" }} 
    />
    <span style={{ fontFamily: "'Raleway', sans-serif", fontSize: "14px", color: "#333" }}>
      SVASTI TECH SOLUTION
    </span>
  </div>
  <div>
  </div>
</div>

      

      </div>
      {/* <IconButton color="inherit" onClick={handleSidebarToggle}>
        <MenuIcon />
      </IconButton> */}
      <div className='usernameProfile'>
        <Chip label={userInfo.email} variant="outlined" style={{marginRight:'11px'}} onClick={() => navigateProfileInfo()} />
        {/* <Badge color='success' variant='dot' overlap='circular' anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }} > */}
          {/* {/* <Avatar sx={{ bgcolor: '#00ffff' }} alt={(userInfo.email).toUpperCase()}  src="/static/images/avatar/1.jpg />src="/static/images/avatar/1.jpg"/>*/}
        {/* </Badge> */}
      </div>

      {/* Site Dropdown */}
      <Drawer anchor="left" open={isSidebarOpen} onClose={handleSidebarToggle}>
        <div className="p-4" style={{ width: '300px' }}>
          {/* Sidebar content goes here */}
          <p>Sidebar Content</p>
          {/* <Sidebar/> */}
        </div>
      </Drawer>


    </nav>
  );
};
export default TopNavbar;