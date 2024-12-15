import { Router } from 'express';
import { SignIn, SignOut } from '../controller/auth.js';
import { loginSchema } from '../schema/users.js';
import { validate } from '../middleware/validators.js';

const authRouter = Router();

authRouter.post('/sign-in', validate(loginSchema), SignIn);
authRouter.post('/sign-out', SignOut);

export default authRouter;
