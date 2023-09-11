import { NextFunction, Request, Response, ErrorRequestHandler } from 'express';

const errorHandler: ErrorRequestHandler = (err: any, req: Request, res: Response, next: NextFunction) :void => {
    const errStatus: number = err.statusCode || 500;
    const errMsg: string = err.message || 'Something went wrong';

    res.status(errStatus).json({
        success: false,
        status: errStatus,
        message: errMsg,
    });
};

export = errorHandler;