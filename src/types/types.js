const { Usuarios } = require('../entity/usuarios.js');

/**
 * Error object structure from database or server.
 */
const error = {
  length: 0,
  severity: '',
  code: '',
  detail: '',
  hint: '',
  position: '',
  internalPosition: '',
  internalQuery: '',
  where: '',
  schema: '',
  table: '',
  column: '',
  dataType: '',
  constraint: '',
  file: '',
  line: '',
  routine: '',
};

/**
 * Type representing user information excluding sensitive and operational properties.
 */
const userInfo = {
  ...Usuarios,
  username: undefined,
  last_name: undefined,
  name: undefined,
  password: undefined,
  active: undefined,
  created: undefined,
  updated: undefined,
  insertPassword: undefined,
  updatePassword: undefined,
  comparePasswords: undefined,
  toJSON: undefined,
  toJSONCRE: undefined,
  toJSONUP: undefined,
};

/**
 * Extended request object including optional user and token properties.
 */
const customreq = {
  user: undefined,
  token: undefined,
};

/**
 * Structure for decoded JWT tokens.
 */
const DecodedToken = {
  id: 0,
  email: '',
};

/**
 * Token response structure.
 */
const tokenResponse = {
  token: '',
  expiresIn: 0,
};

/**
 * Error messages for token verification.
 */
const tokenVerificationErrors = {
  'invalid signature': 'La firma del JWT no es válida',
  'jwt expired': 'JWT expirado',
  'invalid token': 'Token no válido',
  'No Bearer': 'Utilizar formato Bearer',
  'jwt malformed': 'JWT formato no válido',
};

/**
 * Structure for JWT errors.
 */
const JwtError = {
  name: '',
  message: '',
};

module.exports = {
  error,
  userInfo,
  customreq,
  DecodedToken,
  tokenResponse,
  tokenVerificationErrors,
  JwtError,
};
