import { AppDataSource } from '../conectDB.js'; // Importa la conexión a la base de datos
import { Clientes } from '../entity/clientes.js';
import { Usuarios } from '../entity/usuarios.js';

const clienteRepository = AppDataSource.getRepository(Clientes);
const usuarioRepository = AppDataSource.getRepository(Usuarios);

export const getAllClientes = async (req, res) => {
    try {
        const clientes = await clienteRepository.find();
        res.status(200).json(clientes);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener los clientes', error });
    }
};

export const createCliente = async (req, res) => {
    try {
        const nuevoCliente = clienteRepository.create(req.body);
        const clienteGuardado = await clienteRepository.save(nuevoCliente);
        res.status(201).json(clienteGuardado);
    } catch (error) {
        res.status(500).json({ message: 'Error al registrar el cliente', error });
    }
};

export const getCliente = async (req, res) => {
    try {
        const { id } = req.params;
        const cliente = await clienteRepository.findOne({ where: { codigo_cliente: id } });
        if (!cliente) {
            return res.status(404).json({ message: `Cliente con id ${id} no encontrado` });
        }
        res.status(200).json(cliente);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener el cliente', error });
    }
};

export const updateCliente = async (req, res) => {
    try {
        const { id } = req.params;
        const cliente = await clienteRepository.findOne({ where: { codigo_cliente: id } });
        if (!cliente) {
            return res.status(404).json({ message: `Cliente con id ${id} no encontrado` });
        }
        clienteRepository.merge(cliente, req.body);
        const clienteActualizado = await clienteRepository.save(cliente);
        res.status(200).json(clienteActualizado);
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el cliente', error });
    }
};

export const deleteCliente = async (req, res) => {
    try {
        const { id } = req.params;
        const cliente = await clienteRepository.findOne({ where: { codigo_cliente: id } });
        if (!cliente) {
            return res.status(404).json({ message: `Cliente con id ${id} no encontrado` });
        }
        await clienteRepository.remove(cliente);
        res.status(200).json({ message: `Cliente con id ${id} eliminado correctamente` });
    } catch (error) {
        res.status(500).json({ message: 'Error al eliminar el cliente', error });
    }
};

export const getAllUsuarios = async (req, res) => {
    try {
        const usuarios = await usuarioRepository.find();
        res.status(200).json(usuarios);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener los usuarios', error });
    }
};

export const createUsuario = async (req, res) => {
    try {
        const nuevoUsuario = usuarioRepository.create(req.body);
        const usuarioGuardado = await usuarioRepository.save(nuevoUsuario);
        res.status(201).json(usuarioGuardado);
    } catch (error) {
        res.status(500).json({ message: 'Error al registrar el usuario', error });
    }
};

export const getUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const usuario = await usuarioRepository.findOne({ where: { codigo_usuario: id } });
        if (!usuario) {
            return res.status(404).json({ message: `Usuario con id ${id} no encontrado` });
        }
        res.status(200).json(usuario);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener el usuario', error });
    }
};

export const updateUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const usuario = await usuarioRepository.findOne({ where: { codigo_usuario: id } });
        if (!usuario) {
            return res.status(404).json({ message: `Usuario con id ${id} no encontrado` });
        }
        usuarioRepository.merge(usuario, req.body);
        const usuarioActualizado = await usuarioRepository.save(usuario);
        res.status(200).json(usuarioActualizado);
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el usuario', error });
    }
};

export const deleteUsuario = async (req, res) => {
    try {
        const { id } = req.params;
        const usuario = await usuarioRepository.findOne({ where: { codigo_usuario: id } });
        if (!usuario) {
            return res.status(404).json({ message: `Usuario con id ${id} no encontrado` });
        }
        await usuarioRepository.remove(usuario);
        res.status(200).json({ message: `Usuario con id ${id} eliminado correctamente` });
    } catch (error) {
        res.status(500).json({ message: 'Error al eliminar el usuario', error });
    }
};