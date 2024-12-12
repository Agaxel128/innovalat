import { AppDataSource } from '../conectDB.js'; // Importa la conexión a la base de datos
import { Clientes } from '../entity/clientes.js'; // Importa la entidad User
const clienteRepository = AppDataSource.getRepository(Clientes);

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