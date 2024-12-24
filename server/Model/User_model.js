const userdbInstance = require('../config/dbInstance');

async function checkEmailexist(username){
    try {
        const checkIsUsernameExist = await userdbInstance.userdb.query('select username from public.credentials where username=$1;', [username]);
        if (checkIsUsernameExist.rows != 0) {
            return true;
        }
        else{
            return false;
        }      
    } catch (error) {
        console.log("user model db issue check email exists");
        return false;
    }
  
}

async function checkpasswordEmpty(username){
    try {
        const password_res =await userdbInstance.userdb.query('select password from public.credentials where username=$1;', [username]);
        if (password_res.rows[0].password == null) {
            return true;
        }
        else{
            return false;
        }
    } catch (error) {
        console.log("check password is empty");
        return false; 
    }
   
}


async function checkuser_status(username){

    try {
        const GetTheUserStatus = await userdbInstance.userdb.query('select status from public."user" where email=$1;', [username]);
        if (GetTheUserStatus.rows[0].status === '1') {
            return true;
        }
        else{
            return false
        }
    } catch (error) {
        console.log("check password is empty");
        return false; 
    }
}

async function getparticular_user_Data(username,password){
    try {
        const getuserdata = await userdbInstance.userdb.query(`SELECT 
            "user".userid,"user".email,"user".phno,"user".fname,"user".lname,
            "user".positionid,"user".adminid,"user".signature,
            (select position from position where positionid = "user".positionid),
            "user".userprofile, "user".status ,accesscontroll.distributer,accesscontroll.product,
            accesscontroll.invoicegenerator,accesscontroll.customer,accesscontroll.staff,accesscontroll.invoicepayslip,accesscontroll.d_staff
            FROM public.credentials
            JOIN public."user" ON credentials.userid = "user".userid
            JOIN public.accesscontroll on accesscontroll.userid = "user".userid
            WHERE credentials.username=$1 and credentials.password = $2;
            `, [username, password]);
        const rowCount = getuserdata.rows.length;
        if (rowCount>0) {
            return getuserdata;
        }
        else{
            return false;
        }
    } catch (error) {
        console.log("user data getting issue in model");
        return false;
    }
   

}


async function getUserData(adminid,position){
    try {
        
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [adminid]);
        // console.log(CheckForStaff.rows[0].positionid);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [adminid]);
            belongsto = getBelongsto.rows[0].adminid;
        } else {
            belongsto = adminid;
        }
    
        // console.log("belongsto : ", belongsto);
    
        const userDeleteResult = await userdbInstance.userdb.query('select * from public."user" where adminid=$1 and positionid=$2 and status=$3 order by rno DESC;', [belongsto, position, '1']);
        return userDeleteResult.rows;
        
    } catch (error) {
        console.log("get userdata is error");
        return false; 
    }
   
}

// update user inactive
async function update_user_status(userid,status){
    try {
        const userUpdateResult = await userdbInstance.userdb.query(`UPDATE public."user"
        SET status=$1
        WHERE userid=$2;`, [status, userid]);
        if (userUpdateResult.rowCount === 1) {
            // The update was successful
            // res.json({ resStatus: status, qos: "success" });
            return true;
        } else {
            // No rows were updated, handle accordingly
           return false;
        }
    } catch (error) {
        console.log("the error occured in model side");
        return false;
    }
}


async function get_before_edit_date(id){
    try {
        const UserDataIndividualResult = await userdbInstance.userdb.query('select * from public."user" where userid=$1', [id]);

        const userAccessControl = await userdbInstance.userdb.query(`SELECT *
        FROM public.accesscontroll where userid=$1;`, [id]);
        const res = {
            user_Data:UserDataIndividualResult.rows[0],
            access_Data:userAccessControl.rows[0]
        };
        return res;


    } catch (error) {
        return false;
        console.log("error edit distributor in model file ");
    }
}

// get state table records in model
async function get_state_data(){
    try {
        const userStateResult =await userdbInstance.userdb.query('SELECT statename FROM public.state;');
        if (userStateResult.rowCount>0) {
            return userStateResult.rows
        }else{
            return false;
        }
    } catch (error) {
        console.log("model file get state data error");
        return false;
    }
}

// get district data
async function get_district_data(){
    try {
        const userdistrictResult =await userdbInstance.userdb.query('SELECT districtname FROM public.district;');
        if (userdistrictResult.rowCount>0) {
            return userdistrictResult.rows;
        }else{
            return false;
        }
    } catch (error) {
        console.log("model file get district data error");
        return false;
    }
}

async function update_user_tb(userdata,AccessOptions){
    try {
        const {
            userid,
            OrganizationName,
            bussinessType,
            gstNumber,
            panNumber,
            aadharNo,
            fName,
            lName,
            Positionid,
            email,
            mobileNo,
            adminid,
            upiPaymentNo,
            accName,
            accNo,
            passbookImg,
    
            pAddress,
            streetAddress,
            City,
            State,
            pCode,
    
            CommunicationAddress,
            StreetAddress2,
            City2,
            State2,
            PostalCode2
        } = userdata;
        console.log(userdata);
        console.log(AccessOptions);
        let access_arr = [];
        let keys_arr = ['Distributor','Products','Invoice Generator','Customer','Staff','Invoice PaySlip','D_Staff'];
        console.log(AccessOptions);
        keys_arr.forEach(function(item,index,arr){
            let find_key =  AccessOptions[item].toLowerCase().trim();
            console.log(find_key);
            access_arr[item] = findindex_value(find_key);
        });
        

        console.log(access_arr);
    
        await userdbInstance.userdb.query('BEGIN');

        const userUpdateResult = await userdbInstance.userdb.query(`UPDATE public."user"
        SET email=$1, phno=$2, aadhar=$3, pan=$4, pstreetname=$5, pdistrictid=$6, pstateid=$7, ppostalcode=$8 , cstreetname=$9, cdistrictid=$10,cstateid=$11, cpostalcode=$12,organizationname=$13, gstnno=$14, bussinesstype=$15, fname=$16, lname=$17, upiid=$18,bankname=$19, bankaccno=$20,passbookimg=$21 WHERE userid=$22;`, [email, mobileNo, aadharNo, panNumber, streetAddress, City, State, pCode, StreetAddress2, City2, State2, PostalCode2, OrganizationName, gstNumber, bussinessType, fName, lName, upiPaymentNo, accName, accNo, passbookImg, userid]);
            

        const UpdateAccessControll = await userdbInstance.userdb.query(`UPDATE public.accesscontroll
            SET  distributer=$1, product=$2, invoicegenerator=$3,customer=$4, staff=$5, invoicepayslip=$6 , d_staff=$7
            WHERE userid=$8;`, [access_arr['Distributor'], access_arr['Products'], access_arr['Invoice Generator'], access_arr['Customer'], access_arr['Staff'], access_arr['Invoice PaySlip'], access_arr['D_Staff'], userid]);
        
        await userdbInstance.userdb.query('COMMIT');

        if (userUpdateResult.rowCount === 1) {
            return true;
        } else {
           return false;
        }


    } catch (error) {
        console.log("model file update user data error");
        return false;
    }
   
}

async function add_user_data(user_details,access_controller,current_user){
    const {
        userid,
        OrganizationName,
        bussinessType,
        gstNumber,
        panNumber,
        aadharNo,
        fName,
        lName,
        Positionid,
        email,
        mobileNo,
        adminid,
        upiPaymentNo,
        accName,
        accHolderName,
        accNo,
        ifscCode,
        passbookImg,

        pAddress,
        streetAddress,
        City,
        State,
        pCode,

        CommunicationAddress,
        StreetAddress2,
        City2,
        State2,
        PostalCode2 } = user_details;
    const status = 1;
    const AccessControls = access_controller;
    const Currentuser = current_user;

    try {
        console.log("model file is calling");
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [adminid]);
        console.log(CheckForStaff.rows[0].positionid);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [adminid]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = adminid
        }

        await userdbInstance.userdb.query('BEGIN');
        // insert data in user table
        const ueserTable = await userdbInstance.userdb.query('INSERT INTO public."user" (userid,email, phno, aadhar, pan, positionid, adminid,status, pstreetname, pdistrictid, pstateid, ppostalcode , cstreetname, cdistrictid,cstateid, cpostalcode,organizationname, gstnno, bussinesstype, fname, lname, upiid,bankname, bankaccno,passbookimg,accholdername,ifsccode,updatedby) VALUES($1, $2, $3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28) RETURNING userid',
            [userid, email, mobileNo, aadharNo, panNumber, Positionid, belongsto, status, streetAddress, City, State, pCode, StreetAddress2, City2, State2, PostalCode2, OrganizationName, gstNumber, bussinessType, fName, lName, upiPaymentNo, accName, accNo, passbookImg, accHolderName, ifscCode, Currentuser]);

        // insert data in credentials table
        const credentialTable = await userdbInstance.userdb.query('INSERT INTO credentials (userid,username,lastupdatedby) VALUES ($1,$2,$3)',
            [userid, email, Currentuser]);

        let access_arr = [];
        let keys_arr = ['Distributor','Products','Invoice Generator','Customer','Staff','Invoice PaySlip','D_Staff'];
        console.log(AccessControls);
        keys_arr.forEach(function(item,index,arr){
            let find_key =  AccessControls[item].toLowerCase().trim();
            console.log(find_key);
            access_arr[item] = findindex_value(find_key);
        });    
       
      
        // console.log('test : ',staff_ac,Distributor_ac,Customer_ac,Products_ac,InvoiceGenerator_ac,InvoicePaySlip_ac);
        const access_controlTable = await userdbInstance.userdb.query('insert into accesscontroll (distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,d_staff,last_updated_by) values ($1,$2,$3,$4,$5,$6,$7,$8,$9)',
            [access_arr['Distributor'], access_arr['Products'], access_arr['Invoice Generator'], userid, access_arr['Customer'], access_arr['Staff'], access_arr['Invoice PaySlip'], access_arr['D_Staff'], Currentuser]);
        await userdbInstance.userdb.query('COMMIT');
       
        return "insert";
    } catch (error) {
        await userdbInstance.userdb.query('ROLLBACK');
        console.error('Error executing database query:', error);
        if (error.message.includes('unique constraint')) {
            return "existing_user";
        } else {
            return "failed_user";
        }
    }

    
}

// get user profile data
async function getprofile_data(userid){
    try {
        const getprofileInfoResult = await userdbInstance.userdb.query('select public."position".position,public."user".* from public."user" join public."position" on public."user".positionid=public."position".positionid where public."user".userid=$1;', [userid]);
        if (getprofileInfoResult.rowCount>0) {
            return getprofileInfoResult.rows;
        }else{
            return false;
        }
    } catch (error) {
       return false;
    }
}

// update user profile data
async function update_user_profiledata(userid,user_data){
    try {
        const {
            fname,
            lname,
            email,
            mobile,
            aadhar,
            pannumber,
            streetname,
            dname,
            sname,
            orgname,
            btype,
            pcode,
    
            bname,
            acno,
            ifsc_code,
            achname,
            upi_id,
            gstno,  
    
    
        } = user_data;
        const userUpdateResult = await userdbInstance.userdb.query(`UPDATE public."user" SET email=$1, phno=$2, aadhar=$3, pan=$4, pstreetname=$5, pdistrictid=$6, pstateid=$7, ppostalcode=$8 , cstreetname=$9, cdistrictid=$10,cstateid=$11, cpostalcode=$12,organizationname=$13,  bussinesstype=$14, fname=$15, lname=$16  , gstnno=$17 , upiid=$18 , bankname=$19, bankaccno=$20 , accholdername=$21 , ifsccode=$22 WHERE userid=$23;`, [email,  mobile,  aadhar,  pannumber, streetname, dname, sname, pcode, streetname, dname, sname, pcode,orgname, btype,fname,lname,gstno,upi_id,bname,acno,achname,ifsc_code,userid]);
            
        if (userUpdateResult.rowCount === 1) {
            return true;
            
        } else {
            return false;   
            
        }
    } catch (error) {
        console.log("user model is error ");
        return false;
    }
}

// find index number
function findindex_value(val){
    let result = 0;
  
    if (val==='noaccess') {
        result = 0;
    }
    else if(val==='view'){
        result = 1;
    }
    else if(val==='edit'){
        result = 2;
    }
    else if(val==='all'){
        result = 3;
    }
    return result;
}


async function insert_signature_data(signame,current_user){
    try {
        console.log("user model ");
        console.log(signame+"  "+current_user);
        const insert_sign = await userdbInstance.userdb.query(`UPDATE public."user" SET signature =$1 where userid=$2;`, [signame, current_user]);
        console.log(insert_sign.rowCount===1);
        if(insert_sign.rowCount===1){
            console.log("profile image updated");
            return true;
        }else{
            return false;
        }
    } catch (error) {
        console.error("Error updating signature in the database:", error);
        return false;
    }
}


async function update_user_password(username,password){
    try {
        console.log("update user password model is working fine");
        const status_password = await userdbInstance.userdb.query(`UPDATE public."credentials"
            SET password=$1
            WHERE username=$2;`, [password, username]);

            if (status_password.rowCount === 1) {
                return true;
            } else {
               return false;
            }
    } catch (error) {
        console.error("Error updating password");
        return false;
    }
}



module.exports = {
    checkEmailexist,
    checkpasswordEmpty,
    checkuser_status,
    getparticular_user_Data,
    getUserData,
    update_user_status,
    get_before_edit_date,
    get_state_data,
    get_district_data,
    update_user_tb,
    add_user_data,
    getprofile_data,
    update_user_profiledata,
    insert_signature_data,
    update_user_password,

}