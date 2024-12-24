const userdbInstance = require('../config/dbInstance');

async function get_product_data(userid){
    try {
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [userid]);
        console.log(CheckForStaff.rows[0].positionid);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [userid]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = userid
        }
        const getAllProductsResult = await userdbInstance.userdb.query(`SELECT rno, productid, quantity, priceperitem, last_updated_by, productname,status ,batchno, cgst, sgst,mrp, reference_id
        FROM public.products where belongsto=$1 and status=$2 order by rno ASC;`, [belongsto, '1']);
        if (getAllProductsResult.rowCount>0) {
            return getAllProductsResult.rows
        }else{
            return false;
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        return false;
    }
}

// update product details function
async function update_product_status(status,product_id,batch_no,current_user,invoice_referenceid){
    try {
        console.log("product modal updation");
        console.log(invoice_referenceid);
        const userUpdateResult = await userdbInstance.userdb.query(`UPDATE public.products
            SET status=$1
            WHERE productid=$2 and  batchno=$3 and belongsto=$4 and reference_id=$5;`, [status, product_id, batch_no, current_user,invoice_referenceid]);
        if (userUpdateResult.rowCount === 1) {
            return true;
        } else {
            return false;
        }

    } catch (error) {
        
    }
}

async function update_product_quantity(hsncode,batchno,currentUserUserid,Quantity){
    try {
        const userUpdateResult = await userdbInstance.userdb.query(`UPDATE public.products
            SET quantity=$1
            WHERE productid=$2 and belongsto=$3 and batchno=$4;`, [Quantity, hsncode, currentUserUserid,batchno]);
            if (userUpdateResult.rowCount === 1) {
                return true;
            } else {
                return false;
            }
    } catch (error) {
        console.error('Error executing database query:', error);
        return false;
    }
}

async function get_product_before_update(userid,productid,batchno){
    try {
        
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [userid]);
        console.log(CheckForStaff.rows[0].positionid);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [userid]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = userid
        }
        // console.log("belongsto : ", belongsto);

        const IndividualProductResult = await userdbInstance.userdb.query('select * from products where productid=$1 and belongsto =$2 and batchno=$3;', [productid, belongsto, batchno]);
        // console.log(IndividualProductResult.rows[0]);
        if(IndividualProductResult.rowCount>0){
            return IndividualProductResult.rows[0];
        }else{
            return false;
        }
    } catch (error) {
        console.log("before update model error");
        return false;
    }
}

// after update function
async function after_update_product(priceperitem,productid,productname,quantity,batchno,CGST,SGCT,updator,mrp){
    try {
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [updator]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [updator]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = updator
        }
        // console.log("belongsto : ", belongsto);

        const userUpdateResult = await userdbInstance.userdb.query(`UPDATE public.products
        SET quantity=$1, priceperitem=$2,productname=$3,batchno=$4,cgst=$5,sgst=$6 , mrp=$7
        WHERE productid=$8 and belongsto=$9 and batchno=$10; `, [quantity, priceperitem, productname, batchno, CGST, SGCT,mrp, productid, belongsto,batchno]);
        if (userUpdateResult.rowCount === 1) {
            // The update was successful
           return true;
        } else {
            // No rows were updated, handle accordingly
          return false;
        }
    } catch (error) {
        console.log("product model error");
        return false;

    }
}


// insertion product 
async function insert_product_data(hsncode,productname,quantity,priceperitem,batchno,CGST,SGCT,updator,mrp){
    try {
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [updator]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [updator]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = updator
        }
        // console.log(belongsto);
        
        const CheckForProductExistance = await userdbInstance.userdb.query(`select * from products where productid=$1 and batchno=$2 and belongsto=$3 and reference_id=$4;`, [hsncode, batchno, belongsto,'ADMIN']);
        if (CheckForProductExistance.rows.length > 0) {
            return "already_exists";
        }
        else {
            await userdbInstance.userdb.query('BEGIN');
            const insertProductResult = await userdbInstance.userdb.query(`INSERT INTO public.products(
                productid, quantity, priceperitem, last_updated_by,productname,belongsto,status,batchno,cgst,sgst,mrp,reference_id)
                VALUES ($1, $2, $3, $4,$5,$6,$7,$8,$9,$10,$11,$12);`, [hsncode, quantity, priceperitem, updator, productname, belongsto, '1', batchno, CGST, SGCT,mrp,'ADMIN']);
            await userdbInstance.userdb.query('COMMIT');
            if (insertProductResult.rowCount === 1) {
                return true;
            } else {
                return false;
            }
        }
        
    } catch (error) {
        console.log("product model insertion error ");
        return false;
    }
}


module.exports = {
   
    get_product_data,
    update_product_status,
    update_product_quantity,
    get_product_before_update,
    after_update_product,
    insert_product_data,
}