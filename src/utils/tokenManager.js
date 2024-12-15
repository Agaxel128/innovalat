import jwt from 'jsonwebtoken';
import { JWT_SECRET, JWT_REFRESH, MODE } from '../config.js';

export const generateToken = (id) => {
  const expiresIn = 60 * 15; // 15 minutes

  try {
    const token = jwt.sign({ id }, JWT_SECRET, { expiresIn });
    return { token, expiresIn };
  } catch (error) {
    console.log(error);
    return undefined;
  }
};

export const generateRefreshToken = (id, res) => {
  const expiresIn = 60 * 60 * 24 * 30; // 30 days

  try {
    const refreshToken = jwt.sign({ id }, JWT_REFRESH, {
      expiresIn,
    });
    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      secure: !(MODE === 'developer'),
      expires: new Date(Date.now() + expiresIn * 1000),
      sameSite: 'none',
    });
  } catch (error) {
    console.log(error);
  }
};
