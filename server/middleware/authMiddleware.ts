import { NextFunction, Request, Response } from 'express';
import jwt, { JwtPayload } from 'jsonwebtoken';

export = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    if (req.method === 'OPTIONS') {
        next();
    };

    try {
        const token: string = req.headers.authorization?.split(' ')[1];
        if (!token) {
            return res.json({status: 'error', msg: 'Не авторизован'});
        }

        const decoded: string | JwtPayload = jwt.verify(token, 'random_secret_key');
        req.user = decoded;

        next();
    } catch (e) {
        res.json({status: 'error', msg: 'Не авторизован'});
    };
};
