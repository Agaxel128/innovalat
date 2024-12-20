import { AppDataSource } from "../conectDB.js";
import { Empresas } from "../entity/empresas.js"; // Asume que tienes una entidad definida para empresas

const repository = AppDataSource.getRepository(Empresas);

export const getAllEmpresas = async (req, res) => {
    try {
        const data = await repository.find();
        res.status(200).json(data);
    } catch (error) {
        res.status(500).json({ "message": "Error al obtener las empresas", error });
    }
};

export const createEmpresa = async (req, res) => {
    try {
        const { nombre, codigo_ciudad, ocupacion, direccion, referencia, telefono, celular, correo, estado } = req.body;

        const newEmpresa = repository.create({
            nombre,
            codigo_ciudad,
            ocupacion,
            direccion,
            referencia,
            telefono,
            celular,
            correo,
            estado: estado ?? false, // Default en caso de que no se envíe
        });

        const savedEmpresa = await repository.save(newEmpresa);
        res.status(201).json(savedEmpresa);
    } catch (error) {
        res.status(400).json({ "message": "Error al registrar la empresa", error });
    }
};

export const getEmpresa = async (req, res) => {
    try {
        const { id } = req.params;
        const empresa = await repository.findOneBy({ id_empresa: id });

        if (!empresa) {
            return res.status(404).json({ "message": `No se encontró la empresa con ID ${id}` });
        }

        res.status(200).json(empresa);
    } catch (error) {
        res.status(500).json({ "message": "Error al obtener la empresa", error });
    }
};

export const updateEmpresa = async (req, res) => {
    try {
        const { id } = req.params;
        const empresa = await repository.findOneBy({ id_empresa: id });

        if (!empresa) {
            return res.status(404).json({ "message": `No se encontró la empresa con ID ${id}` });
        }

        repository.merge(empresa, req.body);
        const updatedEmpresa = await repository.save(empresa);

        res.status(200).json(updatedEmpresa);
    } catch (error) {
        res.status(400).json({ "message": "Error al actualizar la empresa", error });
    }
};

export const deleteEmpresa = async (req, res) => {
    try {
        const { id } = req.params;
        const deleteResult = await repository.delete({ id_empresa: id });

        if (deleteResult.affected > 0) {
            res.status(200).json({ "message": `Empresa con ID ${id} eliminada con éxito` });
        } else {
            res.status(404).json({ "message": `No se encontró la empresa con ID ${id}` });
        }
    } catch (error) {
        res.status(500).json({ "message": "Error al eliminar la empresa", error });
    }
};
