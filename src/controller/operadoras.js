import { AppDataSource } from "../conectDB.js";
import { Operadoras } from "../entity/operadoras.js";

const repository = AppDataSource.getRepository(Operadoras);

// Obtener todas las operadoras
export const getAllOperadoras = async (req, res) => {
    try {
        const operadoras = await repository.find();
        res.status(200).json(operadoras);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener las operadoras", error });
    }
};

// Crear una nueva operadora
export const createOperadora = async (req, res) => {
    try {
        const { codigo_pais, descripcion } = req.body;

        const newOperadora = repository.create({
            codigo_pais,
            descripcion,
        });

        const savedOperadora = await repository.save(newOperadora);
        res.status(201).json(savedOperadora);
    } catch (error) {
        res.status(400).json({ message: "Error al registrar la operadora", error });
    }
};

// Obtener una operadora por ID
export const getOperadora = async (req, res) => {
    try {
        const { id } = req.params;
        const operadora = await repository.findOneBy({ id_operadora: id });

        if (!operadora) {
            return res.status(404).json({ message: `No se encontró la operadora con ID ${id}` });
        }

        res.status(200).json(operadora);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener la operadora", error });
    }
};

// Actualizar una operadora
export const updateOperadora = async (req, res) => {
    try {
        const { id } = req.params;
        const operadora = await repository.findOneBy({ id_operadora: id });

        if (!operadora) {
            return res.status(404).json({ message: `No se encontró la operadora con ID ${id}` });
        }

        repository.merge(operadora, req.body);
        const updatedOperadora = await repository.save(operadora);

        res.status(200).json(updatedOperadora);
    } catch (error) {
        res.status(400).json({ message: "Error al actualizar la operadora", error });
    }
};

// Eliminar una operadora
export const deleteOperadora = async (req, res) => {
    try {
        const { id } = req.params;
        const deleteResult = await repository.delete({ id_operadora: id });

        if (deleteResult.affected > 0) {
            res.status(200).json({ message: `Operadora con ID ${id} eliminada con éxito` });
        } else {
            res.status(404).json({ message: `No se encontró la operadora con ID ${id}` });
        }
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar la operadora", error });
    }
};
