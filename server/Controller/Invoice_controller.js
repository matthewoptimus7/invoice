const jwt = require('jsonwebtoken');
const token_obj = require('../Middleware/authMiddleware');
const invoice_model = require('../Model/Invoice_Model');
const QRCode = require('qrcode');
const fs = require('fs');  // Require the 'fs' module to read files
const path = require('path');
const nodemailer = require('nodemailer');

async function get_invoice_data(req,res){
    try {
        console.log("get transaction details invoice controller function executed");
        const { userid } = req.body;
        console.log(" userid : ",userid);
        const get_invoice_data_status = await invoice_model.get_transaction_invoice_data(userid); 
        if(get_invoice_data_status!=false){
            console.log("controller success function is executed");
            res.json({ status: true, message: "Successfully Data Fetched", data: get_invoice_data_status});
        }else{
            res.status(500).json({ status: false, message: "Invoice data not found some error in controller" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ status: false, message: "Internal Server Error" });
    }
}

async function update_receiver_status(req,res){
    const { invoiceId, textVal } = req.body;
    console.log("invoice receiver status updation");
    try {
        const receiver_status_result = await invoice_model.update_invoice_receiver_status(invoiceId,textVal);

        if (receiver_status_result===true) {
            res.json({ message: "Status Updated Successfully", qos: "success" });
        }else{
            res.status(404).json({ message: "Not Updated Properly" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}


async function update_sender_status(req,res){
    const { invoiceId, belongsto } = req.body;
    // const {}  = req.body;
   
    try {
        console.log("invoice sender status updation in controller");
        const update_sender_status = await invoice_model.update_sender_status(invoiceId,belongsto);

        if(update_sender_status===true){
            res.json({ message: "Status Updated Successfully", qos: "success" });
        }else{
            res.status(404).json({ message: "Not Updated Properly" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}


async function get_invoice_data_transaction_history(req,res){
    try {
        const InvoiceId = req.body.invoiceId;

        console.log("invoice data getting transaction history in controller");
        const invoice_data = await invoice_model.get_invoice_transaction_history(InvoiceId);
        if(invoice_data!=false){
            res.json({message:"successfully data fetched",data:invoice_data});
        }else{
            res.status(500).json({ message: "Internal Server Error data not getting " });
        }
        
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}


async function get_product_data_transaction_history(req,res){
    try{
        const get_product_result = await invoice_model.getproduct_data(req.body.admin_id);
        if (get_product_result!=false) {
            res.json({message:"success",data:get_product_result});    
        }else{
            res.status(500).json({message:"data fetching query error kindly correct "});
        }
        
    }
    catch(error){
        console.error("Error in transaction details page  get product server error");
        res.status(500).json({message:"Internal server"});
    }
}



// generate qr code
async function generate_qr_code(req,res){
    const amount = req.body.totalSum;
    const upi = req.body.upi;
    const currency = 'INR'; 
    const upiId = upi;
    try {
        const razorpayLink = `upi://pay?pa=${upiId}&am=${amount}&cu=${currency}`;
        const qrCodeImage = await QRCode.toDataURL(razorpayLink);
        res.send(qrCodeImage);
        if (qrCodeImage) {
            return `<img src="${qrCodeImage}" alt="Razorpay QR Code" />`;
        } else {
            throw new Error('QR code image data URL is undefined');
        }
    } catch (err) {
        console.error('Error generating QR code:', err);
        throw new Error('Error generating QR code');
    }
}


// invoice module
async function sender_data_invoice_address(req,res){
    const { senderid } = req.body;
    try {
        console.log("invoice controller sender invoice address");
        const get_sender_data = await invoice_model.getsender_address(senderid);
        if (get_sender_data!=false) {
            res.json({ message: "Successfully Data Fetched", data: get_sender_data, status: true });

        }else{
            res.status(300).json({ message: "Invoice model query handling place ocurred error ", status: false });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error", status: false });
    }
}

async function get_user_data(req,res){
    try {
        const { senderID } = req.body.inputValues;
        console.log("invoice controller is executed");
        const get_user_data = await invoice_model.find_user_data(senderID);
        if (get_user_data!=false) {
            res.json({ message: "Successfully Data Fetched", data:get_user_data });            
        }else{
            res.status(500).json({ message: "invoice model data fetching error" });     
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }
}


async function get_product_data(req,res){

    const { senderID } = req.body.inputValues;

    try {
        console.log("invoice product controller working");

        const get_product_res = await invoice_model.get_product_data_list(senderID);

        if (get_product_res!=false) {
            res.json({ message: "Successfully Data Fetched", data: get_product_res });            
        }else{
            res.status(500).json({ message: "data fetching model error in product data" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }

}


async function get_receiver_address(req,res){

    try {
        const { reciverid } = req.body;
        console.log("invoice receiver address getting controller is working");
        const get_res = await invoice_model.get_receiver_add(reciverid);
        if (get_res!=false) {
            res.json({ message: "Successfully Data Fetched", data: get_res, status: true });
        }else{
            res.json({ message: "No Records Found!", status: false });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error", status: false });
    }

}


async function get_exist_sign(req,res){

    const currentUser  = req.body.currentUser;
    try {
        console.log("invoice get existance sign controller working");
        const get_res = await invoice_model.get_exist_sign_data(currentUser);
        if (get_res===true) {
            res.json({ message: "Signature Present", status: true });
        }else{
            res.json({ message: "Signature Absent", status: false });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.status(500).json({ message: "Internal Server Error" });
    }

}


async function get_signature_data(req,res){
    try {
        console.log("invoice controller getting signature is working")
        const { userid } = req.body;
        const get_img_name = await invoice_model.get_signature(userid);
        if(get_img_name!=false){
            const folderPath = '../uploads'; // Change this to the path of your folder
            const fileName = get_img_name;
            const filePath = path.join(folderPath, fileName);
       
            const allowedExtensions = ['jpeg', 'jpg', 'png'];
    
            res.send({ src: `uploads/${fileName}.png` });
        }else{
            res.send("error occured in model");
        }
       
    }
    catch (error) {
        res.send("error");
        console.error("Error retrieving data");
    }
}

// add proforma invoice
async function add_proforma_invoice(req,res){

    const { Buyer, senderID, Date } = req.body.invoice;
    const totalSum = req.body.totalValues;
    const invoiceItem = req.body.invoiceitem;
   
    try {
        const result = await invoice_model.add_proforma_invoice_insert(Buyer,senderID,Date,totalSum,invoiceItem);

       if (result!=false) {
            res.json({ message: "Successfully Proforma-Invoice Generated", status: true, invoiceid: result });
        }else{
            console.log("User ID doesn't exist");
            res.json({ message: "User ID doesn't exist" });
       }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.json({ message: 'Failed to add Invoice', status: false, error: error.message });
    }

}


// add invoice 
async function add_invoice_data(req,res){
    const { Buyer, senderID, Date } = req.body.invoice;
    const totalSum = req.body.totalValues;
    const invoiceItem = req.body.invoiceitem;   
    try {
        console.log("invoice insertion controller");
        const invoice_res = await invoice_model.add_invoice_insert(Buyer,senderID,Date,totalSum,invoiceItem);
        if (invoice_res!=false) {
            res.json({ message: "Successfully Invoice Generated", status: true, invoiceid: invoice_res });
        }else{
            res.json({ message: "User ID doesn't exist" });
        }
    } catch (error) {
        console.error('Error executing database query:', error);
        res.json({ message: 'Failed to add Invoice', status: false, error: error.message });
    }
}


// Nodemailer configuration
const transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587, // or 465
    secure: false,
    auth: {
        user: 'terionorganization@gmail.com',
        pass: 'imkq rydg xtla lvmx'
    }
});

async function send_mail_after_insert(req,res){
    try {
        console.log("invoice insertion file sending in mail controller");
        // Check if file exists in the request
        if (!req.file) {
            res.status(400).json({ message: 'No file uploaded' });
        }

        const invoicesDir = path.join(__dirname, '../EmailPdfContent');

        // Ensure the invoices directory exists
        if (!fs.existsSync(invoicesDir)) {
            fs.mkdirSync(invoicesDir);
        }
        const tempPath = req.file.path;
        const targetPath = path.join(invoicesDir, 'Email.pdf');
        const receiver_mail = await invoice_model.invoice_mail_receiver_mail(req.body.companyname);
        if (receiver_mail!=false) {
            const to = receiver_mail;
            fs.rename(tempPath, targetPath, err => {
                if (err) {
                    console.error('Error saving file:', err);
                    res.status(500).json({ message: 'Error saving file' });
                } else {
                    // Read the PDF file
                    fs.readFile(targetPath, (err, data) => {
                        if (err) {
                            console.error('Error reading PDF file:', err);
                            res.status(500).send('Error reading PDF file');
                        }
    
                        // Mail options
                        const mailOptions = {
                            from: 'terionorganization@gmail.com',
                            to: to,
                            subject: 'Official mail from Terion Organization',
                            text: 'INVOICE FROM TERION',
                            attachments: [
                                {
                                    filename: 'Email.pdf',
                                    content: data
                                }
                            ]
                        };
    
                        // Send mail
                        transporter.sendMail(mailOptions, (error, info) => {
                            if (error) {
                                console.error('Error sending email:', error);
                                res.status(500).send('Error sending email');
                            }
                            console.log('Email sent: ' + info.response);
    
                            // After email is sent successfully, delete the PDF file
                            fs.unlink(targetPath, err => {
                                if (err) {
                                    console.error('Error deleting PDF file:', err);
                                } else {
                                    console.log('PDF file deleted successfully');
                                }
                            });
    
                            res.send({ status: true, message: 'Email sent successfully' });
                        });
                    });
                }
            });     
        }else{
            res.send({ status: false, message:'revceiver mail issue' });
        }
       
       
    } catch (error) {
        res.send({message:'add invoice error'});        
    }
}

module.exports = {
    get_invoice_data,
    update_receiver_status,
    update_sender_status,
    get_invoice_data_transaction_history,
    get_product_data_transaction_history,
    generate_qr_code,

    sender_data_invoice_address,
    get_user_data,
    get_product_data,
    get_receiver_address,
    get_exist_sign,
    get_signature_data,
    add_proforma_invoice,
    add_invoice_data,

    send_mail_after_insert,
}