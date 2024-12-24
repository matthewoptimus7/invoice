const express = require('express');
const app = express();
const cors = require('cors');

// Routes 
const user_route = require('./Routes/User_route');
const product_route = require('./Routes/Product_route');
const feedback_route = require('./Routes/Feedback_route');
const order_route = require('./Routes/Order_route');
const invoice_route = require('./Routes/Invoice_route');



app.use(express.json());
app.use(cors({ origin:'*' }));
// upload folder location
app.use('/uploads',express.static('uploads'));


// middle ware remvoe cache for all headers
app.use((req,res,next)=>{
    res.setHeader('Cache-Control','no-cache , no-store must-revalidate');
    res.setHeader('Pragma','no-cache');
    res.setHeader('Expires','0');
    next();
})


// Routes
app.use('/user/', user_route);
app.use('/products/', product_route);
app.use('/feedback/',feedback_route);
app.use('/invoice/',invoice_route);
app.use('/order/',order_route);

const PORT = 4000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
  
