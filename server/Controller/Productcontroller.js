const jwt = require('jsonwebtoken');
const token_obj = require('../Middleware/authMiddleware');
const product_model = require('../Model/Product_model');


async function getproduct_Data(req,res){
    try {
      
        const { userid } = req.body;
       
        const getprocduct_result = await product_model.get_product_data(userid);
        if(getprocduct_result===false){
            res.status(500).json({ message: "Internal Server Error" });
        }else{
            res.json({ message: "Successfully Data Fetched", data: getprocduct_result });
        }       

    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

// update products
async function update_product(req,res){
    try {
        console.log("product update data working fine");

        const { productid, batchno } = req.body.productDetial;
        const product_reference_id = req.body.productDetial.reference_id;
        const currentUser = req.body.currentUserId;
        const { productdetial, status } = req.body;
       
        const update_status = await product_model.update_product_status(status,productid,batchno,currentUser,product_reference_id);
        if (update_status===true) {
            res.json({ resStatus: update_status, qos: "success" });
        }else{
            console.log("sending response");
            res.status(404).json({ message: "User not found" });
        }
        
    } catch (error) {
        console.error('Error occuring query in controller:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

// update product quantity
async function update_product_quantity(req,res){
    console.log("product update quantity working fine");
    const { hsncode,batchno, currentUserUserid, Quantity } = req.body;
    try {
        const update_status = await product_model.update_product_quantity(hsncode,batchno,currentUserUserid,Quantity);
        if (update_status===true) {
            res.json({ resStatus: "Updated successfully", qos: "success" });
        }else{
            res.status(404).json({ message: "User not found" });
        }
        
    } catch (error) {
        console.error('Error controller  executing database query:', error);
        res.status(500).json({ message: "Internal Server Error " });
    }
}


// before update products
async function before_update_product(req,res){
    const { userid, productid, batchno } = req.body
    console.log("before update controller is calling");
    try {
        
        const get_product_arr = await product_model.get_product_before_update(userid,productid,batchno);
        if (get_product_arr!=false) {
            res.json({ message: "Successfully Data Fetched", data: get_product_arr });            
        }else{
            console.log("query error not data fetching");
            res.status(500).json({ message: "Internal Server Error" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

// after update product function
async function after_update(req,res){
    const { priceperitem,
        productid,
        productname,
        quantity,
        batchno,
        CGST,
        SGCT,
        mrp
    } = req.body.productdetial;
    const { updator } = req.body;
    console.log("after update product data");

    try {
        const update_product_status = await product_model.after_update_product(priceperitem,productid,productname,quantity,batchno,CGST,SGCT,updator,mrp);
        if (update_product_status===true) {
            res.json({ message: "Successfully Updated", status: true });
        }else{
            res.json({ message: "Oops! Something Went Wrong", status: false });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.json({ message: "Internal Server Error", status: false });
    }
}

// add products
async function add_product(req,res){
    const { hsncode, productname, quantity, priceperitem, batchno, CGST, SGCT,mrp } = req.body.productdetial;
    const { updator } = req.body;
    console.log(req.body);
    console.log(req.body.productdetial);
    console.log("add product controller is working fine");
    try {
        const product_insertion_status = await product_model.insert_product_data(hsncode,productname,quantity,priceperitem,batchno,CGST,SGCT,updator,mrp);
        if(product_insertion_status==="already_exists"){
            res.json({ message: "Product Already Exist!", status: false });
        }else if(product_insertion_status===true){
            res.json({ message: "Data inserted Successfully", status: true });
        }else{
            res.status(404).json({ message: "User not found", status: false });
        }
    } catch (error) {
        res.status(500).json({ message: "Internal Server Error", status: false });
    }


}

module.exports = {
  getproduct_Data,
  update_product,
  update_product_quantity,
  before_update_product,
  after_update,
  add_product,
}