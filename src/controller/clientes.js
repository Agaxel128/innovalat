import { AppDataSource } from '../conectDB.js'; // Importa la conexión a la base de datos
import { Clientes } from '../entity/clientes.js'; // Importa la entidad User
const clienteRepository = AppDataSource.getRepository(Clientes);

export const getAllClientes = async (req, res) => {
    try {
        // Obtener página y límite de la consulta o establecer valores predeterminados
        const page = parseInt(req.query.page) || 1; // Página actual
        const limit = parseInt(req.query.limit) || 10; // Tamaño de página
        const skip = (page - 1) * limit; // Calcular documentos a omitir

        // Contar el total de clientes
        const totalClientes = await clienteRepository.count();

        // Obtener los clientes con paginación
        const clientes = await clienteRepository.find({
            skip: skip,
            take: limit,
        });

        // Calcular el número total de páginas
        const totalPages = Math.ceil(totalClientes / limit);

        // Respuesta con los datos paginados y metadatos
        res.status(200).json({
            currentPage: page,
            totalPages: totalPages,
            totalClientes: totalClientes,
            clients: clientes,
        });
    } catch (error) {
        res.status(500).json({ message: "Error al obtener los clientes", error });
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