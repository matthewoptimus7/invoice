const userdbInstance = require('../config/dbInstance');


async function insert_feedback_details(feedback,currentuserId){
    try {
        console.log("feedback form insertion okay in model side");
        await userdbInstance.userdb.query('BEGIN');
        const insertProductResult = await userdbInstance.userdb.query(`INSERT INTO public.feedback(
            userid, feedback,last_updated_by)
                VALUES ($1, $2, $3);`, [currentuserId, feedback, currentuserId]);
        await userdbInstance.userdb.query('COMMIT');
        if (insertProductResult.rowCount === 1) {
            return true;
        } else {
            return false;
        }
    } catch (error) {
        console.log("feedback form insertion error ");
        return false;
    }
}

module.exports={
    insert_feedback_details,
}