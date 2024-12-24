const jwt = require('jsonwebtoken');
const token_obj = require('../Middleware/authMiddleware');
const user_model = require('../Model/User_model');
const fs = require('fs');
const path = require('path');
const { Console } = require('console');

const { promisify } = require('util');
const renameAsync = promisify(fs.rename);

const nodemailer = require('nodemailer');
const crypto = require('crypto');
const CryptoJS = require('crypto-js');
const { API_URL_CLIENT } = require('../serversideConfig');

// login function 
async function login(req,res){
    const { username, password } = req.body;
    const checkIsUsernameExist = await user_model.checkEmailexist(username);
    if (checkIsUsernameExist) {
        const checkIsPasswordEmpty = await user_model.checkpasswordEmpty(username);
        if (checkIsPasswordEmpty) {
            console.log("password is empty : ");
            return res.json({ success: false, password: null, message: 'Set the password' });
        }else{
            const GetTheUserStatus = await user_model.checkuser_status(username);
            if (GetTheUserStatus) {
                const data = await user_model.getparticular_user_Data(username,password)
                if (data != false) {
                  const result = data.rows[0];
                //   console.log(username, password);
                  const token_enc = await token_obj.generateToken(result);
                  res.json({ success: true, data: result,token:token_enc });
                } else {
                  res.json({ success: false, message: 'Invalid Password' });
                }
              }
            else {
                res.json({ success: false, message: 'Your Access Restricted' });
            }
        }
        
    }else{
        console.log("Email doesn't exist");
        res.send({ success: false,message: "Email doesn't exist" });
    }
}

// get staff details
async function get_user_Data(req,res){
    try {
        console.log("get user data controller is calling");
        const { adminid, position } = req.body;
        var userdata = await user_model.getUserData(adminid,position);
        if (userdata!=false) {
            res.json({ message: "Successfully Data Fetched", data: userdata });            
        }else{
            res.status(500).json({ message: "Internal Server Error" });
        }
    }
    catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}


// update user status active inactive [ delete user ]
async function updateStatusToRemove(req,res){
    try {
        console.log("user remvoe controller function is calling...");
        const { userid, status } = req.body;
        var user_status = await user_model.update_user_status(userid,status); 
        if (user_status) {
            res.json({ resStatus: status, qos: "success" });
        }else{
            res.status(500).json({ message: "Internal Server Error" });
        }

    } catch (error) {
        console.error('Error executing in controller side:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
   

}


// before update userdata getting records
async function getUserDataIndividual(req,res){
    try {
        console.log("edit distributor edit controller is calling");
        const { id } = req.params;
        const db_res = await user_model.get_before_edit_date(id);
        if(db_res!=false){
            res.json({ message: "Successfully Data Fetched", data: db_res.user_Data, getuserAccessControl: db_res.access_Data });
        }else{
            res.status(500).json({ message: "Internal Server Error" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }

}

// get state table records in controller 
async function getStateData(req,res){
    try {
        console.log("state controller is calling");
        const userStateResult = await user_model.get_state_data();
        if (userStateResult!=false) {
            res.json({ message: "Successfully Data Fetched", data: userStateResult });            
        }else{
            res.status(500).json({ message: "Internal Server Error" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

async function getDistrictData(req,res){
    try {
        console.log("district controller is calling");
        const district_data = await user_model.get_district_data();
        if (district_data!=false) {
            res.json({ message: "Successfully Data Fetched", data: district_data });            
        }else{
            res.status(500).json({ message: "Internal Server Error" });            
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

async function updateUserDataIndividual(req,res){

    const AccessOptions = req.body.AccessOptions;

    try {
        console.log("update userdata");
        // console.log(AccessOptions);
        // console.log(req.body.inputValues);
        const update_user_tb = await user_model.update_user_tb(req.body.inputValues,AccessOptions);
        if (update_user_tb===true) {
            console.log("updated successfully");
            res.json({ message: "Successfully Updated", status: true });
        }else{
            res.status(404).json({ message: "User not found", status: false });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

// add user data
async function addUserdata(req,res){
    try {
        console.log("add user controller is working fine");

        const add_user_result = await user_model.add_user_data(req.body.userDetials,req.body.AccessControls,req.body.Currentuser);
        if (add_user_result==="insert") {
            res.json({ message: "Data inserted Successfully", status: true });
        }else if(add_user_result==="existing_user"){
            res.json({ message: "User Already Exist", status: false });
        }
        else if(add_user_result==="failed_user"){
            res.json({message:'Failed to add user',status:false});
        }
        
    } catch (error) {
        console.error('Error executing controller error:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

async function get_userprofile_data(req,res){
    try {
       
        console.log("get user profile data in controller");
        const { userid } = req.body;
        const profile_data = await user_model.getprofile_data(userid);
        if (profile_data!=false) {
            console.log("model file execution is success");
            res.json({ message: "Successfully Data Fetched", data: profile_data });            
        }else{
            res.json({ message: "User Not Fount" });
        }
       
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

async function profile_data(req,res){
    const userid = req.body.userId;

    try{
        const profile_update_status = await user_model.update_user_profiledata(userid,req.body.userDetails);
        if (profile_update_status===true) {
            res.json({ message: "Successfully Updated", status: true });
        }else {
            res.json({ message: "Oops! Something Went Wrong DB Updation side", status: false });   
        }

    }
    catch(error){
        console.log("error message for user profile updation in db handling file");
        res.status(500).json({message:'profile updation query error'});
    }
}


async function upload_signature(req,res){
    console.log("profile signature upload function is finished");
    if (!req.file) {
        console.log("file not found");
        res.status(400).json({ message: 'No file uploaded' });
    }else{

   
        console.log(req.file);
        
        const file = req.file;
        const { imageName } = req.body;
        const currentUser = imageName;
        const SignName = `${imageName}.png`;
        const newPath = path.join(__dirname, '../uploads', SignName);
        const oldPath = req.file.path;
         // Rename file
        renameAsync(oldPath, newPath);
        console.log("Name changing condition is working fine");
        
        // Update user signature in database
        const userupdateResult = await user_model.insert_signature_data(SignName, currentUser);
            
        if (userupdateResult === true) {
            res.json({ status: true, message: 'Signature Updated Successfully', filename: SignName });
        } else {
            res.json({ status: false, message: 'Signature updation failed', filename: SignName });
        }
        
      
        /*
        fs.rename(file.path, newPath, async function (err) {
            if (err) {
                console.log("name changeing condition error");
                res.status(500).json({ success: false, message: 'Error renaming file' });
            }
                // try {
                //     console.log("name changeing condition is working fine");
                //     const userupdateResult = await user_model.insert_signature_data(SignName,currentUser);
                //     if (userupdateResult===true) {

                //         res.json({ status: true, message: 'Signature Updated Successfully', filename: SignName });
                //     }else{
                //         res.json({ status: false, message: 'Signature updation is Failed', filename: SignName });
                //     }
                    
                // } catch (error) {
                //     res.status(500).json({ status: false, message: 'Error querying user database' });
                // }
                // res.json({ status: true, message: 'Signature Updated Successfully', filename: SignName });
            
          
        });
        */
    }
   
}


// update password mail service
function encryptString(plainText, secretKey) {
    const encrypted = CryptoJS.AES.encrypt(plainText, secretKey).toString();
    const base64Encoded = btoa(encrypted);
    return base64Encoded;
}

async function send_mail_empty_password(req,res){
    const { username } = req.body
    const to = username;
    const secretKey = 'edf6537e67f256578bbb90b2adb1617622d6cbe49702b832c99c6feb8cce817c';
    const encryptedEmail = encryptString(to, secretKey);
    const link = `${API_URL_CLIENT}UpdatePassword?email=${encodeURIComponent(encryptedEmail)}`;
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'terionorganization@gmail.com',
            pass: 'imkq rydg xtla lvmx',
        },
    });

    const mailOptions = {
        from: 'terionorganization@gmail.com',
        to: to,
        subject: 'Official mail from Terion Organization',
        html: `Update Password<a href="${link}"> Click Here .. </a>`
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log('mailed');
        res.json({ success: true, message: 'Check Your Mail for further Steps' });
    } catch (error) {
        console.error(error);
        res.json({ success: true, message: 'User Added Successfully ! But Failed to send email' });
        // throw new Error('Failed to send email');
    }
}



// update user password
async function update_user_password(req,res){
    const { username, password } = req.body;
    console.log("update password controller is working fine");
    try {
        const checkIsUsernameExist = await user_model.checkEmailexist(username);
        if (checkIsUsernameExist===true) {
            const userUpdateResult = await user_model.update_user_password(username,password);
            if (userUpdateResult === true) {
                // The update was successful
                res.json({ message: "Password Updated Successfully", qos: "success" });
            } else {
                // No rows were updated, handle accordingly
                res.status(404).json({ message: "Not Updated Properly" });
            }
        }
        else {
            console.log("Username doesn't exist");
            res.send({ message: `${username} Username doesn't exist`, status: 'notExist' });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }

}



module.exports = {
    login,
    get_user_Data,
    updateStatusToRemove,
    getUserDataIndividual,
    getStateData,
    getDistrictData,
    updateUserDataIndividual,
    addUserdata,
    get_userprofile_data,
    profile_data,
    upload_signature,
    send_mail_empty_password,
    update_user_password,
}


