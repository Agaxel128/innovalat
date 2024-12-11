export const getAllOperadoras = (req, res) => {
    res.status(200).json({ "message": "Obtener todos los Operadoras" })
}

export const createOperadora = (req, res) => {
    res.status(200).json({ "message": "Registro de Operadora" })
}

export const getOperadora = (req, res) => {
    res.status(200).json({ "message": `Obtener un Operadora con id ${req.params.id}` })
}

export const updateOperadora = (req, res) => {
    res.status(200).json({ "message": `Actualiza un Operadora con id ${req.params.id}` })
}

export const deleteOperadora = (req, res) => {
    res.status(200).json({ "message": `Elimina un Operadora con id ${req.params.id}` })
}