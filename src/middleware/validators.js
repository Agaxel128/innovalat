import { ZodError } from 'zod';

export const validate = (schema) => {
  return async (req, res, next) => {
    try {
      schema.parse({
        params: req.params,
        query: req.query,
        body: req.body,
      });

      next();
    } catch (error) {
      if (error instanceof ZodError) {
        const formattedErrors = error.errors.map((err) => ({
          path: err.path[1],
          message: err.message,
        }));
        return res.status(400).json({
          status: 'fail',
          errors: formattedErrors,
        });
      }
      next(error);
    }
  };
};

