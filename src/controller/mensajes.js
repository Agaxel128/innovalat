import { AppDataSource } from '../conectDB.js';
import { Mensajes } from '../entity/mensajes.js';

const mensajesRepository = AppDataSource.getRepository(Mensajes);

// Obtener todos los mensajes con paginación
export const getAllMensajes = async (req, res) => {
    try {
        const { page = 1, limit = 10 } = req.query; // Página y límite desde la consulta

        // Calcular los registros a omitir
        const skip = (page - 1) * limit;

        // Obtener datos y el total
        const [mensajes, total] = await mensajesRepository.findAndCount({
            skip,
            take: parseInt(limit),
        });

        // Calcular el total de páginas
        const totalPages = Math.ceil(total / limit);

        res.status(200).json({ mensajes, totalPages });
    } catch (error) {
        console.error('Error al obtener los mensajes:', error);
        res.status(500).json({ message: 'Error al obtener los mensajes' });
    }
};


// Crear un mensaje
export const createMensaje = async (req, res) => {
    try {
        const nuevoMensaje = mensajesRepository.create(req.body); // Crea un nuevo mensaje
        const resultado = await mensajesRepository.save(nuevoMensaje); // Guarda en la base de datos
        res.status(201).json(resultado);
    } catch (error) {
        console.error('Error al crear el mensaje:', error);
        res.status(500).json({ message: 'Error al crear el mensaje' });
    }
};

// Obtener un mensaje por ID
export const getMensaje = async (req, res) => {
    try {
        const mensaje = await mensajesRepository.findOne(req.params.id); // Busca el mensaje por ID
        if (!mensaje) {
            return res.status(404).json({ message: 'Mensaje no encontrado' });
        }
        res.status(200).json(mensaje);
    } catch (error) {
        console.error('Error al obtener el mensaje:', error);
        res.status(500).json({ message: 'Error al obtener el mensaje' });
    }
};

// Actualizar un mensaje por ID
export const updateMensaje = async (req, res) => {
    try {
        const mensaje = await mensajesRepository.findOne(req.params.id);
        if (!mensaje) {
            return res.status(404).json({ message: 'Mensaje no encontrado' });
        }
        mensajesRepository.merge(mensaje, req.body); // Actualiza los campos
        const resultado = await mensajesRepository.save(mensaje);
        res.status(200).json(resultado);
    } catch (error) {
        console.error('Error al actualizar el mensaje:', error);
        res.status(500).json({ message: 'Error al actualizar el mensaje' });
    }
};

// Eliminar un mensaje por ID
export const deleteMensaje = async (req, res) => {
    try {
        const mensaje = await mensajesRepository.findOne(req.params.id);
        if (!mensaje) {
            return res.status(404).json({ message: 'Mensaje no encontrado' });
        }
        await mensajesRepository.delete(req.params.id); // Elimina el mensaje
        res.status(200).json({ message: 'Mensaje eliminado correctamente' });
    } catch (error) {
        console.error('Error al eliminar el mensaje:', error);
        res.status(500).json({ message: 'Error al eliminar el mensaje' });
    }
};
