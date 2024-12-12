import { Router } from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { body, validationResult } from 'express-validator';
import { AppDataSource } from '../conectDB.js';
import { User } from '../entities/User.js'; // Asegúrate de tener la entidad `User` en tu base de datos.

const router = Router();
const JWT_SECRET = 'tu_secreto_jwt'; // Cambia esto por un secreto más seguro en producción.

// Registro de usuario (Sign-up)
router.post(
  '/signup',
  [
    body('username').notEmpty().withMessage('El nombre de usuario es requerido'),
    body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres'),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { username, password } = req.body;

    try {
      const existingUser = await AppDataSource.getRepository(User).findOneBy({ username });
      if (existingUser) {
        return res.status(400).json({ message: 'El usuario ya existe' });
      }

      const hashedPassword = await bcrypt.hash(password, 10);

      const newUser = new User();
      newUser.username = username;
      newUser.password = hashedPassword;

      await AppDataSource.getRepository(User).save(newUser);
      res.status(201).json({ message: 'Usuario registrado con éxito' });
    } catch (error) {
      res.status(500).json({ message: 'Error interno del servidor', error });
    }
  }
);

// Inicio de sesión (Sign-in)
router.post(
  '/signin',
  [
    body('username').notEmpty().withMessage('El nombre de usuario es requerido'),
    body('password').notEmpty().withMessage('La contraseña es requerida'),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { username, password } = req.body;

    try {
      const user = await AppDataSource.getRepository(User).findOneBy({ username });
      if (!user) {
        return res.status(401).json({ message: 'Credenciales inválidas' });
      }

      const isPasswordValid = await bcrypt.compare(password, user.password);
      if (!isPasswordValid) {
        return res.status(401).json({ message: 'Credenciales inválidas' });
      }

      const token = jwt.sign({ userId: user.id }, JWT_SECRET, { expiresIn: '1h' });

      res.json({ message: 'Inicio de sesión exitoso', token });
    } catch (error) {
      res.status(500).json({ message: 'Error interno del servidor', error });
    }
  }
);

// Cierre de sesión (Sign-out)
router.post('/signout', (req, res) => {
  // El cierre de sesión con JWT normalmente se maneja en el cliente eliminando el token.
  res.json({ message: 'Cierre de sesión exitoso' });
});

export default router;