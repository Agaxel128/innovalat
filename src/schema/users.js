import { object, string } from 'zod';

export const loginSchema = object({
  body: object({
    email: string({
      required_error: 'El correo electronico es requerido'
    }).email('Correo electrónico no válido'),
    password: string({
      required_error: 'La contraseña es requerida'
    }).min(8, 'La contraseña debe tener al menos 8 caracteres')
  })
});
