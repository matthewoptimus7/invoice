const userdbInstance = require('../config/dbInstance');

async function get_transaction_invoice_data(userid){
    try {
        console.log("get invoice details in transaction module");
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [userid]);
        // console.log(CheckForStaff.rows[0].positionid);
        const res_positionId = CheckForStaff.rows[0].positionid
        console.log("TEst Id position",res_positionId);
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [userid]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = userid
        }
        console.log("belongsto- senderid : ",belongsto);


        
        // const userTransactionResult = await userdbInstance.userdb.query(`select * from invoice where senderid = $1 or receiverid = $2 order by rno DESC;`, [userid,userid]);
        const userTransactionResult = await userdbInstance.userdb.query(`SELECT invoice.*, public."user".email
        FROM invoice
        JOIN public."user" ON public."user".userid = invoice.receiverid
        WHERE senderid = $1 OR receiverid = $2
        ORDER BY rno DESC;`, [belongsto, belongsto]);

        if (userTransactionResult.rowCount>0) {
            console.log("transaction details module final value is executed");
            console.log(userTransactionResult.rows);
            return userTransactionResult.rows;

        }else{
            return false;
        }
    } catch (error) {
        console.log("get transaction details history error in model");
        return false;
        
    }
}


async function update_invoice_receiver_status(invoiceId,textVal){
    try {
        console.log("invoice receiver status updation in model");
        const reciverStatusResult = await userdbInstance.userdb.query(`UPDATE public.invoice
            SET reciverstatus=$1, transactionid=$2
            WHERE invoiceid=$3;`, ['1', textVal, invoiceId]);
        if (reciverStatusResult.rowCount === 1) {
            return true;
        } else {
            return false;
        }
    } catch (error) {
        return false;
    }
}


async function update_sender_status(invoiceId,belongsto){
    try {
        const senderStatusResult = await userdbInstance.userdb.query(`UPDATE public.invoice
            SET senderstatus=$1
            WHERE invoiceid=$2;`, ['1', invoiceId]);

        const getuserid = await userdbInstance.userdb.query(`SELECT userid from public."user" where email=$1;`, [belongsto]);
        
        const getuseridRes = getuserid.rows[0].userid;

        const updateProductStatus = await userdbInstance.userdb.query(`UPDATE public.products
        SET status=$1
        WHERE belongsto=$2 and reference_id=$3;`, ['1', getuseridRes,invoiceId]);
        
        if (senderStatusResult.rowCount === 1) {
            return true;
        } else {
            return false;
        }
    } catch (error) {
        console.log("invoice sender status updation error");
        return false;
    }
}

async function get_invoice_transaction_history(InvoiceId){
    try {
        console.log("invoice data in transaction history model");

        const result = await userdbInstance.userdb.query(`SELECT invoice.*,invoice_item.*,(select productname from products where productid=invoice_item.productid and batchno=invoice_item.batchno and belongsto=invoice.senderid and reference_id=invoice.invoiceid) as productname  FROM invoice
        JOIN invoiceitem as invoice_item ON invoice.invoiceid = invoice_item.invoiceid  where invoice.invoiceid=$1;`,[InvoiceId]);

        console.log("sender id is");
        const sender_id = result.rows[0].senderid;
        const receiver_id = result.rows[0].receiverid;

        const sender_data = await userdbInstance.userdb.query('SELECT userid, email, phno, aadhar, pan, positionid, adminid, updatedby,status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode,organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode, signature FROM public."user"  WHERE userid=$1',[sender_id]);
        const receiver_data = await userdbInstance.userdb.query('SELECT userid, email, phno, aadhar, pan, positionid, adminid, updatedby,status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode,organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode, signature FROM public."user"  WHERE userid=$1',[receiver_id]);
        if(result.rowCount>0){
            const output = {
                invoice_data:result.rows,
                sender_data:sender_data.rows,
                receiver_data:receiver_data.rows,
            };
            
    
            return output;
        }else{
            return false;
        }
       

    } catch (error) {
        console.log("invoice data getting in transaction history model error");
        return false;    
    }
}

async function getproduct_data(belongsto){
    try {
        console.log("product data getting in invoice model ");
        const product_data = await userdbInstance.userdb.query(`SELECT * FROM products where status='1' and belongsto=$1  and quantity>0 ORDER BY rno ASC`,[belongsto]);
        if (product_data.rowCount>0) {
            return product_data.rows;
        }else{
            return false;
        }
    } catch (error) {
        console.log("get product data in transaction history invoice model");
        return false;
    }
}


// invoice module
async function getsender_address(senderid){
    try {
        
        console.log("invoice model file execution");
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [senderid]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let SenderInvoiceId;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [senderid]);
            SenderInvoiceId = getBelongsto.rows[0].adminid
        } else {
            SenderInvoiceId = senderid
        }

        const SenderInvoiceAddressRes = await userdbInstance.userdb.query('select * from public."user" where userid=$1;', [SenderInvoiceId]);
        if (SenderInvoiceAddressRes.rowCount>0) {
            return SenderInvoiceAddressRes.rows;
        }else{
            return false;
        }
    } catch (error) {
        console.log("invoice sender address module error ");
        return false;
    }
}

async function find_user_data(senderID){
    try {
        console.log("invoice model user data fetching");
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [senderID]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [senderID]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = senderID
        }
        const getUserList = await userdbInstance.userdb.query(`SELECT organizationname
        FROM public."user" where adminid=$1 and status=$2 and (positionid = $3 or positionid = $4 )order by rno DESC;`, [belongsto, '1', 2, 3]);
        
        if (getUserList.rowCount>0) {
            return getUserList.rows;
        }else{
            return false;
        }

    } catch (error) {
        console.log("invoice user data finding model error");
        return false;
    }
}


async function get_product_data_list(senderID){
    try {
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [senderID]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [senderID]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = senderID
        }

        // productid,batchno,productname,priceperitem, cgst, sgst
        const getProductListResult = await userdbInstance.userdb.query(`SELECT * 
        FROM public.products where belongsto=$1 and status =$2 order by rno DESC;`, [belongsto, '1']);

        if (getProductListResult.rowCount>0) {
            return getProductListResult.rows;
        }else{
            return false;
        }
    } catch (error) {
        console.log("product data getting invoice module error");
        return false;

    }
}


async function get_receiver_add(receiverid){
    try {
        const ReciverInvoiceAddressRes = await userdbInstance.userdb.query('select * from public."user" where organizationname=$1 order by rno;', [receiverid]);
        if (ReciverInvoiceAddressRes.rowCount>0) {
            return ReciverInvoiceAddressRes.rows;
        } else {
            return false;
        }
    } catch (error) {
        console.log("invoice receiveraddress getting model file error  ");
        return false;
    }
}


async function get_exist_sign_data(currentUser){
    try {
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [currentUser]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [currentUser]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = currentUser
        }
        const userSignResult = await userdbInstance.userdb.query(`SELECT signature FROM public."user" where userid = $1;`,[belongsto]);
        if (userSignResult.rows[0].signature == null) {
            return false;
        }else{
            return true;
        }
       
    } catch (error) {
        console.log("invoice model error in get existance function error");
        return false;
    }
}


async function get_signature(userid){
    try {
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [userid]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [userid]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = userid
        }

        return belongsto;
    } catch (error) {
        console.log("invoice model getting signature its error");
        return false;
    }
}

async function add_proforma_invoice_insert(Buyer,senderID,Date,totalSum,invoiceItem){
    
    try {
        console.log("proforma invoice insertion data in model");
        const Currentuser = senderID;
        const getReciverId = await userdbInstance.userdb.query('select email from public."user" where organizationname=$1;', [Buyer]);
        const recivermail = getReciverId.rows[0].email;
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [senderID]);

        const res_positionId = CheckForStaff.rows[0].positionid

        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [senderID]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = senderID
        }

        const checkIsUsernameExist = await userdbInstance.userdb.query('select email from public."user" where email=$1 and adminid=$2;', [recivermail, belongsto]);
        if (checkIsUsernameExist.rows != 0) {
            await userdbInstance.userdb.query('BEGIN');

            const ForReciverId = await userdbInstance.userdb.query(
                `select userid from public."user" where email=$1`, [recivermail]
            );

            const reciverID = ForReciverId.rows[0].userid
            const InvoiceTableResult = await userdbInstance.userdb.query(
                `INSERT INTO public.proformainvoice(
                    senderid,receiverid,senderstatus,date,total,lastupdatedby)
                VALUES ($1,$2,$3,$4,$5,$6) RETURNING invoiceid;`, [belongsto, reciverID, 0, Date, totalSum,Currentuser]
            );
            const invoiceid = InvoiceTableResult.rows[0].invoiceid;
            for (const item of invoiceItem) {          

                const prodcut_data_invoice = await userdbInstance.userdb.query(`SELECT priceperitem,batchno,cgst,sgst,mrp  FROM public.products where productid=$1 `,[item.hsncode]);
                let priceperitem = prodcut_data_invoice.rows[0].priceperitem;
                let batchno = prodcut_data_invoice.rows[0].batchno;
                let cgst = prodcut_data_invoice.rows[0].cgst;
                let sgst = prodcut_data_invoice.rows[0].sgst;
                let product_mrp = prodcut_data_invoice.rows[0].mrp;

                const InvoiceItemTableResult = await userdbInstance.userdb.query(
                    `INSERT INTO public.proformainvoiceitem(
                    invoiceid,productid,quantity,discountperitem,cost,hsncode,lastupdatedby,batchno,priceperitem, cgst, sgst,mrp_price)
                    VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);`, [invoiceid, item.hsncode, item.Quantity, item.Discount, item.Total,item.hsncode,Currentuser,batchno,priceperitem,cgst,sgst,product_mrp]
                );
            }
            await userdbInstance.userdb.query('COMMIT');
            return invoiceid;
        } else {
            return false;
            
        }
    } catch (error) {
        console.log("proforma invoice insertion error in model side");
        return false;
    }
}


async function add_invoice_insert(Buyer,senderID,Date,totalSum,invoiceItem){
    try {
        console.log("invoice insertion model");
        const Currentuser = senderID;
        const getReciverId = await userdbInstance.userdb.query('select email,userid from public."user" where organizationname=$1;', [Buyer]);
        const recivermail = getReciverId.rows[0].email;
        const reciveruserid = getReciverId.rows[0].userid;
        const CheckForStaff = await userdbInstance.userdb.query(`select positionid from public."user" where userid=$1;`, [senderID]);
        const res_positionId = CheckForStaff.rows[0].positionid
        let belongsto;
        if (res_positionId == 4 || res_positionId == 5) {
            const getBelongsto = await userdbInstance.userdb.query(`select adminid from public."user" where userid=$1;`, [senderID]);
            belongsto = getBelongsto.rows[0].adminid
        } else {
            belongsto = senderID
        }
        const checkIsUsernameExist = await userdbInstance.userdb.query('select email from public."user" where email=$1 and adminid=$2;', [recivermail, belongsto]);
        if (checkIsUsernameExist.rows != 0) {
            await userdbInstance.userdb.query('BEGIN');
                const ForReciverId = await userdbInstance.userdb.query(
                    `select userid from public."user" where email=$1`, [recivermail]
                );
        
                const reciverID = ForReciverId.rows[0].userid
                const InvoiceTableResult = await userdbInstance.userdb.query(
                    `INSERT INTO public.invoice(
                        senderid,receiverid,senderstatus,date,total,lastupdatedby)
                    VALUES ($1,$2,$3,$4,$5,$6) RETURNING invoiceid;`, [belongsto, reciverID, 0, Date, totalSum,Currentuser]
                );
                const invoiceid = InvoiceTableResult.rows[0].invoiceid;
                for (const item of invoiceItem) {       
                    const ReduceFromSenderTable = await userdbInstance.userdb.query(
                        `UPDATE products
                        SET quantity = quantity - $1
                        WHERE belongsto=$2 and productid = $3 and batchno = $4;`, [item.Quantity, belongsto, item.hsncode, item.batchno]
                    );
    
                    // this condition is already getting invoice in particular batch number and userid i need to remove it
                    /*
                    const checkProductAlreadyExist = await userdbInstance.userdb.query(
                            `select productid from public.products WHERE belongsto=$1 and productid=$2 and batchno = $3`, [reciverID, item.hsncode, item.batchno]
                    );
                    if (checkProductAlreadyExist.rows.length > 0) {
                        const UpdateToRecieverTable = await userdbInstance.userdb.query(
                            `Update public.products SET quantity=quantity+$1 WHERE belongsto=$2 AND productid=$3 AND batchno = $4;`, [item.Quantity, reciverID, item.hsncode, item.batchno]
                        );
                    } else {
                    */
                        const getAllOtherDetails = await userdbInstance.userdb.query(
                            `select priceperitem ,cgst , sgst,mrp from public.products WHERE belongsto=$1 and productid=$2 and batchno = $3`, [belongsto, item.hsncode, item.batchno]
                        );
                        const priceperitem = getAllOtherDetails.rows[0].priceperitem;
    
                        const cgst = getAllOtherDetails.rows[0].cgst;
                        const sgst = getAllOtherDetails.rows[0].sgst;
                        const product_mrp = getAllOtherDetails.rows[0].mrp;
                        const AddToRecieverTable = await userdbInstance.userdb.query(
                            `INSERT INTO public.products(
                                productid, quantity,productname,belongsto, status , batchno , priceperitem , cgst , sgst,last_updated_by,mrp,reference_id)
                                VALUES ($1, $2, $3, $4,$5,$6,$7,$8,$9,$10,$11,$12);`, [item.hsncode, item.Quantity, item.productName, reciverID, 0, item.batchno, priceperitem, cgst, sgst,Currentuser,product_mrp,invoiceid]
                        );
                    // }
    
                    // const product_data = await userdbInstance.userdb.query(`select priceperitem,cgst,sgst,mrp from public.products where productid=$1 and belongsto=$2 and  batchno = $3`,[item.hsncode,belongsto,item.batchno]);
                    // const priceperitem = product_data.rows[0].priceperitem;
                    // const cgst = product_data.rows[0].cgst;
                    // const sgst = product_data.rows[0].sgst;
                    // const product_mrp = product_data.rows[0].mrp;
                    const InvoiceItemTableResult = await userdbInstance.userdb.query(
                        `INSERT INTO public.invoiceitem(
                        invoiceid,productid,quantity,discountperitem,cost,batchno,priceperitem, cgst, sgst,mrp_price)
                        VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10);`, [invoiceid, item.hsncode, item.Quantity, item.Discount, item.Total,item.batchno,priceperitem,cgst,sgst,product_mrp]
                    );
                }
            await userdbInstance.userdb.query('COMMIT');
            return invoiceid;
        } else {
            return false;
        }
 
    } catch (error) {
        console.log("invoice model error in add invoice");
        return false;
    }
   
}


async function invoice_mail_receiver_mail(companyname){
    try {
        console.log("invoice after insertion model get receiver mail");
        const recivermail = await userdbInstance.userdb.query('select email from public."user" where organizationname=$1', [companyname]);
        if(recivermail.rowCount>0){
            const to = recivermail.rows[0].email;
            return to;
        }else{
            return false;
        }
    } catch (error) {
        console.log("invoice model error");
        return false;
    }
}

module.exports = {
    get_transaction_invoice_data,
    update_invoice_receiver_status,
    update_sender_status,
    get_invoice_transaction_history,
    getproduct_data,

    getsender_address,
    find_user_data,
    get_product_data_list,
    get_receiver_add,
    get_exist_sign_data,
    get_signature,
    add_proforma_invoice_insert,

    add_invoice_insert,
    invoice_mail_receiver_mail,
}