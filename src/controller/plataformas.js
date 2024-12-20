import { AppDataSource } from "../conectDB.js";
import { Plataformas } from "../entity/Plataformas.js";

const repository = AppDataSource.getRepository(Plataformas);

// Obtener todas las plataformas
export const getAllPlataformas = async (req, res) => {
    try {
        const plataformas = await repository.find();
        res.status(200).json(plataformas);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener las plataformas", error });
    }
};

// Crear una nueva plataforma
export const createPlataforma = async (req, res) => {
    try {
        const { descripcion } = req.body;

        const newPlataforma = repository.create({
            descripcion,
        });

        const savedPlataforma = await repository.save(newPlataforma);
        res.status(201).json(savedPlataforma);
    } catch (error) {
        res.status(400).json({ message: "Error al registrar la plataforma", error });
    }
};

// Obtener una plataforma por ID
export const getPlataforma = async (req, res) => {
    try {
        const { id } = req.params;
        const plataforma = await repository.findOneBy({ id_plataforma: id });

        if (!plataforma) {
            return res.status(404).json({ message: `No se encontró la plataforma con ID ${id}` });
        }

        res.status(200).json(plataforma);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener la plataforma", error });
    }
};

// Actualizar una plataforma
export const updatePlataforma = async (req, res) => {
    try {
        const { id } = req.params;
        const plataforma = await repository.findOneBy({ id_plataforma: id });

        if (!plataforma) {
            return res.status(404).json({ message: `No se encontró la plataforma con ID ${id}` });
        }

        repository.merge(plataforma, req.body);
        const updatedPlataforma = await repository.save(plataforma);

        res.status(200).json(updatedPlataforma);
    } catch (error) {
        res.status(400).json({ message: "Error al actualizar la plataforma", error });
    }
};

// Eliminar una plataforma
export const deletePlataforma = async (req, res) => {
    try {
        const { id } = req.params;
        const deleteResult = await repository.delete({ id_plataforma: id });

        if (deleteResult.affected > 0) {
            res.status(200).json({ message: `Plataforma con ID ${id} eliminada con éxito` });
        } else {
            res.status(404).json({ message: `No se encontró la plataforma con ID ${id}` });
        }
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar la plataforma", error });
    }
};
