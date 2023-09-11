import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken';

export = (role: string) => {
    return (req: any, res: Response, next: NextFunction) => {
        if (req.method === 'OPTIONS') {
            next();
        }
        
        try {
            const token: string = req.headers.authorization?.split(' ')[1];
            if (!token) {
                return res.json({msg: 'Not authorized'});
            }

            const decoded: any = jwt.verify(token, 'random_secret_key');

            if (decoded.role !== role) {
                return res.json({msg: 'No access'});
            }

            req.user = decoded;
            next();
        } catch (e) {
            res.json({msg: 'Not authorized'});
        } 
    };
};
