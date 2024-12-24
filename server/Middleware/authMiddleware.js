const jwt = require('jsonwebtoken');
const { jwtSecret } = require('../serversideConfig');

const authenticateJWT = (req, res, next) => {
  const token = req.headers.authorization && req.headers.authorization.split(' ')[1];

  if (token) {
    jwt.verify(token, jwtSecret, (err, user) => {
      if (err) {
        return res.sendStatus(403);
      }

      req.user = user;
      next();
    });
  } else {
    res.sendStatus(401);
  }
};


const generateToken = (userId) => {
    return jwt.sign({ userId }, jwtSecret, { expiresIn: '1h' });
  };

module.exports = { authenticateJWT ,generateToken};
