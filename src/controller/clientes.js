export const getAllClientes = (req, res) => {
    res.status(200).json({ "message": "Obtener todos los clientes" })
}

export const createCliente = (req, res) => {
    res.status(200).json({ "message": "Registro de cliente" })
}

export const getCliente = (req, res) => {
    res.status(200).json({ "message": `Obtener un cliente con id ${req.params.id}` })
}

export const updateCliente = (req, res) => {
    res.status(200).json({ "message": `Actualiza un cliente con id ${req.params.id}` })
}

export const deleteCliente = (req, res) => {
    res.status(200).json({ "message": `Elimina un cliente con id ${req.params.id}` })
}