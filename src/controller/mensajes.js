export const getAllMensajes = (req, res) => {
    res.status(200).json({ "message": "Obtener todos los Mensajes" })
}

export const createMensaje = (req, res) => {
    res.status(200).json({ "message": "Registro de Mensaje" })
}

export const getMensaje = (req, res) => {
    res.status(200).json({ "message": `Obtener un Mensaje con id ${req.params.id}` })
}

export const updateMensaje = (req, res) => {
    res.status(200).json({ "message": `Actualiza un Mensaje con id ${req.params.id}` })
}

export const deleteMensaje = (req, res) => {
    res.status(200).json({ "message": `Elimina un Mensaje con id ${req.params.id}` })
}