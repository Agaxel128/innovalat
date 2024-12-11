export const getAllUsuarios = (req, res) => {
    res.status(200).json({ "message": "Obtener todos los Usuarios" })
}

export const createUsuario = (req, res) => {
    res.status(200).json({ "message": "Registro de Usuario" })
}

export const getUsuario = (req, res) => {
    res.status(200).json({ "message": `Obtener un Usuario con id ${req.params.id}` })
}

export const updateUsuario = (req, res) => {
    res.status(200).json({ "message": `Actualiza un Usuario con id ${req.params.id}` })
}

export const deleteUsuario = (req, res) => {
    res.status(200).json({ "message": `Elimina un Usuario con id ${req.params.id}` })
}