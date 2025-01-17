import React from 'react';
import '../../assets/style/App.css';
import { API_URL } from '../../config/config'


//import icons from fontawesome and react icon kit
import { Icon } from 'react-icons-kit';
import { ic_label_important } from 'react-icons-kit/md/ic_label_important';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faDiamond } from '@fortawesome/free-solid-svg-icons';
import { faAnglesDown, faChevronDown, faChevronUp } from '@fortawesome/free-solid-svg-icons';
// import { Button, Navbar, Nav, Form, FormControl } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.min.js';
import { useState, useEffect, useRef } from "react";
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';
import { AddUserBtn } from '../common/AddUserBtn';
import { Snackbar } from '@mui/material';
import MuiAlert from '@mui/material/Alert';
import { overflow_visible, padding_top, position_initial } from '../../assets/style/cssInlineConfig';

// jwt decode token 
import { decodeToken } from '../../config/decode_jwt';

const Products = () => {
    const jwt_token = sessionStorage.getItem('token');

    const userInfoString = decodeToken(jwt_token);
    const userInfo = userInfoString.userId;
    //states
    const [allnetdata, setnetwork] = useState([]);
    const [allupdatedata, setdevice_updated_on] = useState([]);
    const [isOpen1, setIsOpen1] = useState(false);
    const [isOpen2, setIsOpen2] = useState(false);
    const [isOpen4, setIsOpen4] = useState(false);
    const [isDropdownOpen1, setIsDropdownOpen1] = useState(false);
    const [isDropdownOpen2, setIsDropdownOpen2] = useState(false);
    const [isDropdownOpen4, setIsDropdownOpen4] = useState(false);
    const [rotatedIndex, setRotatedIndex] = useState(null);
    const [device_active, setdevice_active] = useState("");
    const [isEditing, setIsEditing] = useState(false);
    const [text, setText] = useState('1');
    const [activeCount, setactiveCount] = useState(0);
    const [inactiveCount, setinactiveCount] = useState(0);
    const [deviceModel_data, setdevicemodel] = useState([]);
    const [deviceName_data, setdevicename] = useState([]);
    const [active_inactive, setactive_inactive] = useState([]);
    const [selectedOption, setSelectedOption] = useState('All');
    // const dropdownRef1 = useRef(null);
    const dropdown1 = () => {
        setIsOpen1(!isOpen1);
        setIsDropdownOpen1(!isDropdownOpen1);
    };


    const [isOpen3, setIsOpen3] = useState(false);
    const [isDropdownOpen3, setIsDropdownOpen3] = useState(false);
    const dropdownRef3 = useRef(null);
    const dropdown3 = () => {
        setIsOpen3(!isOpen3);
        setIsDropdownOpen3(!isDropdownOpen3);
    };
    const empty_space_down3 = (event) => {
        if (!dropdownRef3.current.contains(event.target)) {
            setIsOpen3(false);
            setIsDropdownOpen3(false)

        }
    };


    // //Navigate to Add Device Page
    const navigate = useNavigate();
    const handleclick = () => {
        navigate('Add_Products');
    }

    // //rotate the arrow in the device action
    const handleIconClick = (index) => {
        setRotatedIndex(rotatedIndex === index ? null : index);
      
    };



    const handleDivClick = () => {
        setIsEditing(true);
    };

    const handleInputChange = (event) => {
        setText(event.target.value);
    };

    const handleInputBlur = () => {
        setIsEditing(false);
    };
    const [isless_than_10_active, setisless_than_10_active] = useState(false)
    const [isgreater_than_10_inactive, setisgreater_than_10_inactive] = useState(false)
    useEffect(() => {
        if (activeCount < 10) {
            setisless_than_10_active(true)
        }
        else {
            setisless_than_10_active(false);
        }
        if (inactiveCount < 10) {
            setisgreater_than_10_inactive(true)
        }
        else {
            setisgreater_than_10_inactive(false);
        }
    })

    //navigate to edit page
    const Product_edit_page = (data) => {
       

        navigate(`Edit_Product_Details/${data.productid}/${data.batchno}`);
    }
    const [alldata, setAlldate] = useState([]);
    const fetchData = async () => {
        try {
            const userid = userInfo.userid;
            const response = await axios.post(`${API_URL}products/get_product/data`, { userid },{
                headers:{
                    Authorization: `Bearer ${jwt_token}`
                }
            });
            setAlldate(response.data.data);
        } catch (error) {
            console.error("Error fetching user data:", error);
        }
    };

    
    useEffect(() => {
        fetchData();
    }, []);

    const currentUserid = userInfo.userid
    const updateUserStatus = async (productdetial, currentstatus, index) => {
        const conformation = window.confirm("Are You Sure  Want To Remove This Product?");
        if (conformation) {
            try {
                // update/productremove 
                const response = await axios.put(`${API_URL}products/update_product/productremove`, {
                    productDetial: productdetial, currentUserId: currentUserid, status: currentstatus
                },{
                    headers:{
                        Authorization: `Bearer ${jwt_token}`
                    }
                });
                // console.log(response); 
                if (response.data.qos === "success") {
                    setRotatedIndex(rotatedIndex === index ? null : index);
                    setAlldate((prevData) => {
                        const newData = [...prevData];
                        newData[index].status = response.data.resStatus;
                        return newData;
                    });
                    fetchData();
                }
            } catch (error) {
                console.error('Error updating user status:', error);
            }
        }
        // const userInfoString = sessionStorage.getItem("UserInfo");
        // const userInfo = JSON.parse(userInfoString);
    }
    const [editableIndex, setEditableIndex] = useState(null);
    const updateInDb = async (id, batchno,quantity, index) => {
        setEditableIndex(null)
        // console.log(id, "call update api", quantity);
        const UpdateProductQuantityApi = async () => {
            try {
                // update/productQuantity
                const response = await axios.put(`${API_URL}products/update_product/productQuantity`, {
                    hsncode: id, batchno:batchno , currentUserUserid: userInfo.userid, Quantity: quantity
                },{
                    headers:{
                        Authorization: `Bearer ${jwt_token}`
                    }
                });
                console.log(response);
                if (response.data.qos === "success") {
                  
                    setsubmittedSuccess(true);
                    setresAlert(response.data.resStatus);
                    // alert(response.data.resStatus);
                }
            } catch (error) {
                setsubmitted(true);
                setresAlert("Error updating user status !");
                console.error('Error updating user status:', error);
            }
        }


        if (currectQuantity !== quantity) {
            const confirmation = window.confirm("Are you sure you want to update the quantity?");
            if (confirmation) {
                UpdateProductQuantityApi()
            } else {
                setAlldate((prevData) => {
                    const newData = [...prevData];
                    console.log(newData[index]);
                    newData[index].quantity = currectQuantity;
                    return newData;
                  
                });
            }
        }

    }
    const [currectQuantity, setcurrectQuantity] = useState(null)
    const handleDoubleClick = (index, currectQuantity) => {
        setEditableIndex(index);
        setcurrectQuantity(currectQuantity);
        // const dataString = alldata.map(obj => JSON.stringify(obj)).join(',');
        // console.log(`hai: ${dataString}`);
    };

    const getTheValue = (event) => {
        alert(event.target.value)
    }
    const handleQuantityChange = (event, index) => {
        const newQuantity = event.target.value;
        const newData = [...alldata];
        newData[index].quantity = newQuantity;
        setAlldate(newData);
        // console.log(`Quantity changed for index ${index}: ${newQuantity}`);
    };
    const [resAlert, setresAlert] = useState(null);
    const [submittedSuccess, setsubmittedSuccess] = useState(false);
    const [setsubmitted, setsetsubmitted] = useState(false);
    const handleSnackbarClose = () => {
        setsubmittedSuccess(false);
        setsetsubmitted(false);
    };

    return (
        <div className='bar'>
            {/* Snackbar start */}
            <Snackbar open={submittedSuccess} autoHideDuration={5000} onClose={handleSnackbarClose} anchorOrigin={{
                vertical: 'bottom',
                horizontal: 'right',
            }}>
                <MuiAlert onClose={handleSnackbarClose} severity="success" sx={{ width: '100%' }}>
                    {resAlert}
                </MuiAlert>
            </Snackbar>
            <Snackbar open={setsubmitted} autoHideDuration={5000} onClose={handleSnackbarClose} anchorOrigin={{
                vertical: 'bottom',
                horizontal: 'right',
            }}>
                <MuiAlert onClose={handleSnackbarClose} severity="warning" sx={{ width: '100%' }}>
                    {resAlert}
                </MuiAlert>
            </Snackbar>
            <div className='status-bar'>
                <div className="device_mangement_main_content">
                    <div className="row_with_count_status">
                        <span className='module_tittle'>Products </span>
                        {((userInfo.position === 'Manufacturer') || (userInfo.position === 'staff')) &&
                            <AddUserBtn adduserFun={handleclick} value={"Add Products"} />
                        }
                             {/* <h5 style={{color: 'red'}}>Hello{userInfo.position}</h5> */}
                    </div>
                  
                    <div className='col-headings'>
                        <div className="col-head">HSN Code</div>
                        <div className="col-head">Batch No</div>
                        <div className="col-head">Product Name</div>
                        <div className="col-head">Quantity</div>
                        <div className="col-head">Invert Price</div>
                        <div className="col-head">MRP Price</div>
                        <div className="col-head col-headAction">Action</div>
                    </div>
                    <div className="scroll_div">
                        {alldata.map((data, index) => (
                            <div className="datas skeleton-block">
                                <div className="col-head" key={index}>{data.productid}</div>
                                <div className="col-head" key={index}>{data.batchno}</div>
                                <div className="col-head" key={index}>{data.productname}</div>
                                {/* <div className="col-head editable"  onDoubleClick={() => (((userInfo.position === 'Manufacturer') || (userInfo.position === 'staff')) && handleDoubleClick(index, data.quantity))}>{data.quantity}</div> */}
                                {/* {console.log(data.productid)} */}
                                {editableIndex === index ? (
                                    <input
                                        type="number"
                                        className='col-head'
                                        autoFocus={((userInfo.position === 'Manufacturer') || (userInfo.position === 'staff'))}
                                        value={data.quantity}
                                        onBlur={() => (((userInfo.position === 'Manufacturer') || (userInfo.position === 'staff')) && updateInDb(data.productid, data.batchno,data.quantity, index))}
                                        onChange={(event) => (((userInfo.position === 'Manufacturer') || (userInfo.position === 'staff')) && handleQuantityChange(event, index))}
                                    />
                                ) : (
                                    <div
                                        className="col-head editable"
                                        onDoubleClick={() => (((userInfo.position === 'Manufacturer') || (userInfo.position === 'staff')) && handleDoubleClick(index, data.quantity))}
                                    >
                                        {data.quantity}
                                    </div>
                                )}
                                <div className="col-head" key={index}>{data.priceperitem}</div>
                                <div className="col-head" key={index}>{data.mrp}</div>
                                {(userInfo.positionid==='2' || userInfo.positionid==='5')?(
                                    <>
                                        {(parseInt(data.quantity)>0)?(
                                            <>
                                                <div className='col-head'></div>
                                            </>
                                        ):(
                                            <>
                                                <div className='col-head display-flex device_action_dropdown_parent ' style={overflow_visible}>
                                                    <div className="sts_icon"  onClick={() => handleIconClick(index)}>
                                                        <Icon icon={ic_label_important} style={{ transform: rotatedIndex === index ? 'rotate(90deg)' : 'rotate(0)', color: rotatedIndex === index ? '#08c6cd' : 'lightgray', }} className='device_content_arrow' size={25} />
                                                    </div>
                                                    {/* {console.log(data)} */}
                                                    <div key={index}>{(rotatedIndex === index) &&
                                                        (<div className='device_action_dropdown' style={position_initial}>
                                                            <div className='display-flex device_action_dropdown2 dropdown_action'>
                                                                <FontAwesomeIcon icon={faAnglesDown} className='device_content_arrows' size='lg' />
                                                                <div className='device_content_dropdown display-flex'   onClick={() => updateUserStatus(data, 0, index)}>Delete Product</div>
                                                            </div>
                                                        </div>)}
                                                    </div>
                                                </div>
                                            </>    
                                        )}
                                        
                                    </>
                                ):(
                                    <>
                                    <div className='col-head display-flex device_action_dropdown_parent ' style={overflow_visible}>
                                        <div className="sts_icon"  onClick={() => handleIconClick(index)}>
                                            <Icon icon={ic_label_important} style={{ transform: rotatedIndex === index ? 'rotate(90deg)' : 'rotate(0)', color: rotatedIndex === index ? '#08c6cd' : 'lightgray', }} className='device_content_arrow' size={25} />
                                        </div>
                                        {/* {console.log(data)} */}
                                        <div key={index}>{(rotatedIndex === index) &&
                                            (<div className='device_action_dropdown' style={position_initial}>
                                                <div className='display-flex device_action_dropdown1 dropdown_action'>
                                                    <FontAwesomeIcon className='device_content_arrows' icon={faAnglesDown} size='lg' />
                                                    <div className='device_content_dropdown display-flex'
                                                        onClick={() => Product_edit_page(data)}
                                                    >Edit Product Details</div>
                                                </div>
                                                <div className='display-flex device_action_dropdown2 dropdown_action'>
                                                    <FontAwesomeIcon icon={faAnglesDown} className='device_content_arrows' size='lg' />
                                                    {data.status == 1 ? (
                                                        <div className='device_content_dropdown display-flex'
                                                            onClick={() => updateUserStatus(data, 0, index)}
                                                        >Delete Product
                                                        </div>
                                                    ) : (
                                                        <div className='device_content_dropdown display-flex'
                                                            onClick={() => updateUserStatus(data, 1, index)}
                                                        >Activate Product
                                                        </div>
                                                    )}

                                                </div>
                                            </div>)}
                                        </div>
                                    </div>
                                    </>
                                )}
                             
                               
                            </div>

                        ))}
                    </div>
                   
                </div>
            </div>

            {/* Edit Device details */}
            <div class="modal fade device_status_action" id="device_status_action" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="device_status_header">
                            <h5 class="modal-title" id="exampleModalLabel">EDIT DEVICE DETAILS
                            </h5>
                            {/* <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> */}
                        </div>
                        <div class="device_status_body">
                            <div className="dsa_row1">
                                <div className="dsa_1st_input">
                                    <label for="input1">Device Name</label>
                                    <div className="inputs-group">
                                        <span class="input-group-loc"><Icon icon={ic_label_important} size={20} style={{ color: "lightgray" }} /></span>
                                        <input type="text" value={"device_name"} class="form-control-loc" id="input1" />
                                    </div>
                                </div>
                                <div className="dsa_1st_input">
                                    <label for="input1">Client ID</label>
                                    <div className="inputs-group">
                                        <span class="input-group-loc"><Icon icon={ic_label_important} size={20} style={{ color: "lightgray" }} /></span>
                                        <input type="text" value={"client_id"} class="form-control-loc" id="input1" />
                                    </div>
                                </div>
                            </div>

                            <div className="dsa_row2">
                                <div className="dsa_2nd_input">
                                    <label for="input1">Device MAC Address</label>
                                    <div className="inputs-group">
                                        <span class="input-group-loc"><Icon icon={ic_label_important} size={20} style={{ color: "lightgray" }} /></span>
                                        <input type="text" value={"device_mac_address"} class="form-control-loc" id="input1" />
                                    </div>
                                </div>
                                <div className="dsa_2nd_input">
                                    <label for="input1">Firmware Version</label>
                                    <div className="inputs-group">
                                        <span class="input-group-loc"><Icon icon={ic_label_important} size={20} style={{ color: "lightgray" }} /></span>
                                        <input type="text" value={"device_firmware_version"} class="form-control-loc" id="input1" />
                                    </div>
                                </div>
                            </div>

                            <div className="dsa_row3">
                                <div className="dsa_3rd_input">
                                    <label for="input1">Device Model</label>
                                    <div className="inputs-group">
                                        <span class="input-group-loc"><Icon icon={ic_label_important} size={20} style={{ color: "lightgray" }} /></span>
                                        <input type="text" value={"device_model"} class="form-control-loc" id="input1" />
                                    </div>
                                </div>
                                <div className="dsa_3rd_input">
                                    <div className="dsa_updates">
                                        <div className="updated_by">
                                            <label htmlFor="updated_by_name" className='dsa_updates_heading'>Last Updated By
                                            </label>
                                            <div id="updated_by_name">Quantanics</div>
                                        </div>
                                        <div className="updated_on">
                                            <label htmlFor="updated_by_date" className='dsa_updates_heading'>Last Updated On
                                            </label>
                                            <div id="updated_by_date">20 march 2023, 12:57</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="device_status_footer">
                            <button type="button" class="btn-loc inactive-loc" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Products;