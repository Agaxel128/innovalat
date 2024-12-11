export const getAllPlataformas = (req, res) => {
    res.status(200).json({ "message": "Obtener todos los Plataformas" })
}

export const createPlataforma = (req, res) => {
    res.status(200).json({ "message": "Registro de Plataforma" })
}

export const getPlataforma = (req, res) => {
    res.status(200).json({ "message": `Obtener un Plataforma con id ${req.params.id}` })
}

export const updatePlataforma = (req, res) => {
    res.status(200).json({ "message": `Actualiza un Plataforma con id ${req.params.id}` })
}

export const deletePlataforma = (req, res) => {
    res.status(200).json({ "message": `Elimina un Plataforma con id ${req.params.id}` })
}