const userdbInstance = require('../config/dbInstance');
const { format } = require('date-fns');
const format_query = require('pg-format');

async function order_product(receiverid,order_item_data,order_data){
    try {
        console.log(order_item_data);
        console.log("product order model calling ");
        const receiver_data = await userdbInstance.userdb.query('SELECT * FROM public."user" WHERE userid=$1',[receiverid]);
        let upi_id = receiver_data.rows[0].upiid;
      
        await userdbInstance.userdb.query('BEGIN');
        const insertProductResult = await userdbInstance.userdb.query(`INSERT INTO public.order_management(
            hsncode, cgst, sgst, quantity, grandtotal, order_date, receiverid, position_id, order_status, sender_id, payment_method, last_updated_by, upi_id,cgst_amount, sgst_amount)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13,$14,$15) RETURNING order_id `, [order_data.product_id,order_data.cgst,order_data.sgst,order_data.no_of_product,order_data.total_price_amount,order_data.invoice_date,order_data.receiverid,order_data.positionid,0,order_data.sender_id,order_data.payment_method,order_data.sender_id,upi_id,order_data.cgst_amount,order_data.sgst_amount]);
        
        await userdbInstance.userdb.query('COMMIT');

        console.log("insert order management its okay");
        const order_id =  insertProductResult.rows[0].order_id;
        console.log(order_id);
        const insertData = order_item_data.map(item => {
            let remaining_quantity = 0;
            if(parseInt(item.remaining)<0){
                remaining_quantity = 0;
            }else{
                remaining_quantity = item.remaining;
            }
            return [
                order_id,
                item.product_id,
                item.quantity, 
                order_data.total_price_amount,
                item.cgst, 
                item.sgst, 
                item.batch_no,
                order_data.sender_id,
                item.product_price, 
                item.reference_id,
                item.mrp,
                remaining_quantity,
            ];
        });
        /* when customer order product its reduce product quantity these logic this thats the reason i could command this
        console.log(order_item_data);
        order_item_data.map(async(item,index)=>{
           console.log(item.remaining);
            var remaining_quantity = 0;
            if(parseInt(item.remaining)<0){
                remaining_quantity = 0;
            }else{
                remaining_quantity = item.remaining;
            }
            console.log("product updation ");
            console.log(remaining_quantity);
            console.log(item.reference_id);
            await userdbInstance.userdb.query('BEGIN');
            const product_update_multiple_rows = await userdbInstance.userdb.query(`UPDATE products SET quantity =$1 WHERE productid=$2 and belongsto=$3 and batchno=$4 and reference_id=$5;`,[remaining_quantity,item.product_id,order_data.receiverid,item.batch_no,item.reference_id]);
            await userdbInstance.userdb.query('COMMIT');
        });
        console.log("product table updation  its okay");
        console.log(insertData);
        */
        await userdbInstance.userdb.query('BEGIN');
        const order_item = format_query(`INSERT INTO public.order_item(
            order_id, hsncode, product_quantity, total_amount, cgst, sgst, batch_no, last_updated_by, product_price,product_reference_id,product_mrp_price,remaining_quantity)
            VALUES %L`,insertData);

        const insertion_result = await userdbInstance.userdb.query(order_item);
        await userdbInstance.userdb.query('COMMIT');
       
        const output = {
            receiver_data:receiver_data.rows[0],
            total_amount:order_data.total_price_amount,
            payment_method:order_data.payment_method,
        };
        if (receiver_data.rowCount>0) {
            return output;
        }else{
            return false;
        }
    } catch (error) {
        console.log("customer order product model error");
        return false;
    }
}



async function get_orderData(userid){
    try {
        console.log("get order data in model");
        const order_data = await userdbInstance.userdb.query(`SELECT om.*,(select fname||' '||lname from public."user" where public."user".userid=om.receiverid) as fullname , (select distinct(productname)  as productname from products where productid=om.hsncode and batchno=$1 and belongsto=om.receiverid )as productname FROM public.order_management as om where om.order_status=$2 and om.receiverid=$3`,['Batch-1','0',userid]);
        if (order_data.rowCount>0) {
            console.log(order_data.rows);
            return order_data.rows;
        }else{
            return false;
        }

    } catch (error) {
        console.log("get order data error in model");
        return false;
    }
}


async function get_before_update(order_id){

    try {
        const order_item = await userdbInstance.userdb.query(`SELECT * FROM order_item where order_id=$1`,[order_id]);
        if (order_item.rowCount>0) {
            return order_item.rows;
        }else{
            return false;
        }
    } catch (error) {
        console.log("before update model error");
        return false;
    }

}


async function order_cancel_product(order_data,order_item,payment_status){
    try{
        console.log("order cancel function execute in model file");
        await userdbInstance.userdb.query('BEGIN');
        const update_order_management  = await userdbInstance.userdb.query(`update order_management SET order_status=$1,payment_status=$2,last_updated_by=$3 WHERE order_id=$4`,[1,payment_status,order_data.last_updated_by,order_data.order_id]);
        await userdbInstance.userdb.query('COMMIT');

        if (parseInt(update_order_management.rowCount)===1) {
            /* in order cancel time its working fine
            await userdbInstance.userdb.query('BEGIN');
            const update_values = order_item.map((item) => `(${Math.max(0, parseInt(item.product_quantity))}, '${item.hsncode}', '${order_data.receiverid}', '${item.batch_no}')`).join(', ');

            const updateQuery = `UPDATE products AS p
                SET quantity = quantity + v.quantity_val
                FROM (VALUES ${update_values}) AS v(quantity_val, product_id_val,distributorid,batch_no)
                WHERE p.productid = v.product_id_val and p.belongsto = v.distributorid and p.batchno=v.batch_no; `;
           

            await userdbInstance.userdb.query(updateQuery);
            await userdbInstance.userdb.query('COMMIT');
            */
            return true;
        }else{
            return false;
        } 
    }catch(error){
        console.log("order cancelling db error");
       return false;
    }
}


async function Order_submition(order_data,order_item,payment_status){
    try {

        console.log("order submission function executed in model");
        // invoice parent table adding data
        const sender_id = order_data.receiverid;
        const receiver_id = order_data.sender_id;
        const total_amount = order_data.grandtotal;
        const last_updated_by = order_data.last_updated_by;
        const transaction_id = order_data.transaction_id;
        const currentDate = new Date();
        const current_date = format(currentDate, 'yyyy-MM-dd');

        // invoice item table adding data
        const order_id = order_data.order_id;

        console.log(order_item);
        order_item.map(async(item,index)=>{
           console.log(item.remaining_quantity);
            var remaining_quantity = 0;
            if(parseInt(item.remaining_quantity)<0){
                remaining_quantity = 0;
            }else{
                remaining_quantity = item.remaining_quantity;
            }
            console.log("product updation ");
            console.log(remaining_quantity);
            
            await userdbInstance.userdb.query('BEGIN');
            const product_update_multiple_rows = await userdbInstance.userdb.query(`UPDATE products SET quantity =$1 WHERE productid=$2 and belongsto=$3 and batchno=$4 and reference_id=$5;`,[remaining_quantity,item.hsncode,sender_id,item.batch_no,item.product_reference_id]);
            await userdbInstance.userdb.query('COMMIT');
        });
        console.log("product table updation  its okay");
        


        // first update order management parent table 
        // await userdbInstance.userdb.query('BEGIN');
        const InvoiceTableResult = await userdbInstance.userdb.query(
            `INSERT INTO public.invoice(
                senderid, receiverid, invoicedate,discount, total, lastupdatedby, senderstatus, date, reciverstatus, transactionid)
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING invoiceid;`, [sender_id,receiver_id , current_date,0,total_amount,last_updated_by,1,current_date,1,transaction_id]
        );
        // await userdbInstance.userdb.query('COMMIT');
        // await userdbInstance.userdb.query('BEGIN');
        const invoiceid = InvoiceTableResult.rows[0].invoiceid;
        console.log("transaction id is:\t"+invoiceid);
        // await userdbInstance.userdb.query('BEGIN');
        const invoice_data_arr = order_item.map(item => {
            return [
                invoiceid,
                item.hsncode,
                item.product_quantity,
                parseFloat(parseFloat(item.product_quantity)*parseFloat(item.product_price)),
                0,
                last_updated_by,
                item.hsncode,
                item.batch_no,
                item.product_price,
                item.cgst,
                item.sgst,
                item.product_mrp_price,
            ];
        });
        const invoiceitem_insertion = format_query(`INSERT INTO public.invoiceitem(
            invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, hsncode, batchno, priceperitem, cgst, sgst, mrp_price)
            VALUES %L`,invoice_data_arr);
        // await userdbInstance.userdb.query('COMMIT');
        
        // await userdbInstance.userdb.query('BEGIN');
        const invoice_item_insert_result = await userdbInstance.userdb.query(invoiceitem_insertion);
            console.log("invoice item insertion okay")
            console.log("order id:\t"+order_id);
        const Order_submition_status = await userdbInstance.userdb.query(`UPDATE order_management SET order_status=$1, transaction_id=$2, last_updated_by=$3, payment_status=$4 WHERE order_id=$5`,[1,transaction_id,last_updated_by,payment_status,order_id]);
            console.log("all queries are executed");
        // await userdbInstance.userdb.query('COMMIT');
        return invoiceid;
        // second 

        
    } catch (error) {
        // await userdbInstance.userdb.query('ROLLBACK');
        console.log("db error for order management table updation issue");
        return false;
    }
}

module.exports={
    order_product,
    get_orderData,
    get_before_update,
    order_cancel_product,
    Order_submition,
}