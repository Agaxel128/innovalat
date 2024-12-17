import { Usuarios, comparePasswords } from '../entity/usuarios.js'; // Modelo para la tabla mg_usuarios
import { AppDataSource } from '../conectDB.js';
import { generateToken } from '../utils/tokenManager.js';

const usuariosRepository = AppDataSource.getRepository(Usuarios);

export const SignIn = async (req, res) => {
    const { email, password } = req.body;

    try {
        // Buscar usuario por correo
        const user = await usuariosRepository.findOneBy({ correo: email });
        if (user === null) {
            return res.json({
                status: 'fail',
                errors: { path: 'email', message: 'El correo no está registrado' },
            });
        }

        // Validar contraseña
        const valid = await comparePasswords(password, user.password);
        if (valid === false) {
            return res.json({
                status: 'fail',
                errors: { path: 'password', message: 'Contraseña incorrecta' },
            });
        }

        // Generar token
        const token = generateToken(user.codigo_usuario);
        return res.json({ status: 'ok', token, codigo: user.codigo_usuario });
    } catch (error) {
        console.error('Error en SignIn:', error);
        return res.status(500).json({ error: 'Error interno del servidor' });
    }
};


export const refreshToken = async (req, res) => {
    try {
        if (!req.user) {
            return res.json({ message: 'Usuario no autenticado' });
        }

        const decoded = generateToken(req.user);
        return res.json({
            token: decoded?.token,
            expiresIn: decoded?.expiresIn,
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ error: 'Error interno del servidor' });
    }
};

export const SignOut = async (_req, res) => {
    res.clearCookie('refreshToken');
    return res.json({ message: 'Sesión cerrada correctamente' });
};
