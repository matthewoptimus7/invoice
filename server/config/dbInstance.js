const Pool = require('pg').Pool;
const userdb = new Pool({
    user: 'postgres',
    host: '127.0.0.1',
    database: 'terion_billing',
    password: 'Sher@2005', //quantanics123
    port: 5432,
});
module.exports = {userdb};