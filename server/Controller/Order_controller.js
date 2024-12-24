const jwt = require('jsonwebtoken');
const token_obj = require('../Middleware/authMiddleware');
const order_model = require('../Model/Order_model');


async function customer_order(req,res){
    try {
        console.log("customer order product controller");
        let receiverid = req.body.order_data.receiverid;
        const req_data = req.body.order_data;
        const order_item = req.body.order_item;
        console.log(order_item);
        const order_status = await order_model.order_product(receiverid,order_item,req_data);
        if (order_status!=false) {
            res.json({message:"successfully insert",data:order_status,status:true});
        }else{
            res.json({message:"Customer order insertion check the model result",status:false});
        }
    } catch (error) {
        console.log("Error Customer order insertion error");
        res.json({message:"Customer order insertion error",status:false});
    }
}


// order management module
async function get_order_data(req,res){
    try {
        console.log("get order data in controller");
        const get_data = await order_model.get_orderData(req.body.userid);
        if (get_data!=false) {
            res.json({
                message:"Success",
                data:get_data,
            });      
        }else{
            console.log("order data is empty");
            res.json({message:"error occured",data:[]});
        }
      
    } catch (error) {
        res.status(500).json({message:"Internal server error for getting order management data"});
    }
}


async function get_order_item(req,res){
    try {
        const get_particular_data = await order_model.get_before_update(req.body.order_id);
        if(get_particular_data!=false){
            res.json({
                message:'Success',
                data:get_particular_data,
            });
        }else{
            
            res.json({
                message:'updation data fetching error',
                data:[],
            });
        }
       
    } catch (error) {
        res.status(5000).json({message:"Internal server error in order item data getting error"});
    }
}




// distributor order status updation
async function order_status_updation_distributor(req,res){

    try {
        const payment_status = req.body.payment_status;
        const transaction_id = req.body.order_data.transaction_id;
        const order_data = req.body.order_data;
        const order_item = req.body.order_item;
        console.log("distributor or distributor staff update customer details");
        
        if((payment_status==='payment_failure') && (transaction_id===null || transaction_id==='')){
            console.log("payment failure condition is occured");
            const product_order_submit = await order_model.order_cancel_product(order_data,order_item,payment_status);

            if (product_order_submit===true) {
                res.json({message:" Order Cancelling updation and product added  successfully",status:true});        
            }else{
                res.status(6000).json({message:'DB error for order management table updation issue'});
            }
        
        }else if((payment_status==='online_payment') && (transaction_id!=null || transaction_id!='') ){
        
            const product_order_submit = await order_model.Order_submition(order_data,order_item,payment_status);
            if (product_order_submit!=false) {

                res.json({message:"updation successfully",status:true,invoice_id:product_order_submit});
            
            }else{
                res.status(6000).json({message:'DB error for Order management table updation issue'});
            }

        }
    } catch (error) {
        res.status(6000).json({message:'DB error for Order management table updation issue'});
    }

}

module.exports={
    customer_order,
    get_order_data,
    get_order_item,
    order_status_updation_distributor,
}