const jwt = require('jsonwebtoken');
const { JWT_SECRET, JWT_REFRESH } = require('../config');
const tokenVerificationErrors = require('../types/tokenVerificationErrors'); // Define your error mappings here.

const auth = async (req, res, next) => {
  try {
    const token = req.header('Authorization')?.replace('Bearer ', '');
    if (!token) throw new Error('No Bearer');

    const { id } = jwt.verify(token, JWT_SECRET);

    req.user = id;
    next();
  } catch (error) {
    console.log("Error al verificar el token:", error);
    const message = error.message || 'Invalid token';
    res.status(401).json({ error: tokenVerificationErrors[message] || 'Unauthorized' });
  }
};

const requireRefreshToken = (req, res, next) => {
  try {
    const refreshTokenCookie = req.cookies.refreshToken;
    if (!refreshTokenCookie) throw new Error('No existe el refreshToken');

    const { id } = jwt.verify(refreshTokenCookie, JWT_REFRESH);

    req.user = id;
    next();
  } catch (error) {
    const message = error.message || 'Invalid refresh token';
    res.status(401).json({ error: tokenVerificationErrors[message] || 'Unauthorized' });
  }
};

module.exports = {
  auth,
  requireRefreshToken,
};