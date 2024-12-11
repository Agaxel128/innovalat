export const getAllEmpresas = (req, res) => {
    res.status(200).json({ "message": "Obtener todos los Empresas" })
}

export const createEmpresa = (req, res) => {
    res.status(200).json({ "message": "Registro de Empresa" })
}

export const getEmpresa = (req, res) => {
    res.status(200).json({ "message": `Obtener un Empresa con id ${req.params.id}` })
}

export const updateEmpresa = (req, res) => {
    res.status(200).json({ "message": `Actualiza un Empresa con id ${req.params.id}` })
}

export const deleteEmpresa = (req, res) => {
    res.status(200).json({ "message": `Elimina un Empresa con id ${req.params.id}` })
}