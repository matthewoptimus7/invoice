const jwt = require('jsonwebtoken');
const token_obj = require('../Middleware/authMiddleware');
const feedback_model = require('../Model/Feedback_Model');

async function add_client_feedback(req,res){
    console.log("feedback forminsertion okay in controller side");
    const feedback = req.body.feedback;
    const currentuserId = req.body.currentuserId;
    try {
        const feedback_insert_status = await feedback_model.insert_feedback_details(feedback,currentuserId);
        if (feedback_insert_status===true) {
            res.json({ message: "Thank you! for your Feedback", status: true });
        }else{
            res.status(404).json({ message: "User not found", status: false });
        }
    } catch (error) {
        if (error.code === '23505') {
            res.json({ message: "Unique constraint violation: Duplicate entry", status: false });
        } else {
            res.status(500).json({ message: "Internal Server Error", status: false });
        }
    }
}


module.exports={
    add_client_feedback,

}
