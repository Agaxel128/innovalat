import { AppDataSource } from "../conectDB.js"
import { Estados } from "../entity/estados.js"

const repository = AppDataSource.getRepository(Estados)

export const getAllEstados = async (req, res) => {
    const data = await repository.find()
    res.status(200).json(data)
}

export const createEstado = async (req, res) => {
    const { descripcion } = req.body
    const newEstado = {
        id_estado: "159753",
        descripcion
    }

    const data = await repository.create(newEstado)
    await repository.save(data).then((data) => {
        res.status(200).json(data)
    })
}

// No creo que sea necesario ya que esto debe ser fijo en el sistema
export const getEstado = async (req, res) => {
    const { id } = req.params
    const data = await repository.findOneBy({ id_estado: id })
    if (data === null) return res.status(404).json({ "message": `No se encontró el estado` })
    res.status(200).json(data)
}

export const updateEstado = async (req, res) => {
    const estado = await repository.findOneBy({ id_estado: req.params.id })

    await repository.merge(estado, req.body)

    await repository.save(estado).then((data) => {
        res.status(200).json(data)
    }).catch((er) => {
        console.log(er)
        res.status(400).json({ "message": "Error no se puede actualizar" })
    })

}

export const deleteEstado = async (req, res) => {
    const { id } = req.params

    const data = await repository.delete({ id_estado: id })

    if (data.affected > 0) return res.status(200).json({ "message": `Se eliminó el estado con exito` })

    res.status(400).json({ "message": `No se pudo eliminar el estado` })
}