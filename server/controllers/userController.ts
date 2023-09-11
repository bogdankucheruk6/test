import { NextFunction, Request, Response } from 'express';
import { Model } from 'sequelize';
import bcrypt from 'bcrypt';
import {Result, validationResult} from "express-validator";
import { ReqBodyAuth, Error } from '../types/controllerTypes/userTypes'
import { ModelUser } from '../types/modelTypes/modelTypes';
import { User } from '../models/model';
import generateJwt from '../managers/generateJwt';

const registration = async (req: Request, res: Response, next: NextFunction): Promise<Response | void> => {
    try {
        const {name, email, password, role}: ReqBodyAuth = req.body;
        const error: Result = validationResult(req);

        if (!error.isEmpty()) {
            return res.status(400).json({status: 'err', msg: error});
        }

        if (!email || !password) {
            return res.status(400).json({status: 'err', msg: 'Не правильний Email, або пароль !'});
        }


        const candidate: Model<ModelUser> | null = await User.findOne({where: {email}});
        if (candidate) {
            return res.status(400).json({status: 'err', msg: 'Данний юзер вже існує !'});
        }

        const hashPassword: string = await bcrypt.hash(password, 5);
        const user: any = await User.create({name, email, password: hashPassword, role});

        const token: string = generateJwt(user.id, user.name, user.email, user.role);
        return res.json({token, status: 'ok', msg: 'Ви успішно зареєстрували користувача !'});
    } catch (err: any) {
        next(err);
    };
};

const login = async (req: Request, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const {email, password}: ReqBodyAuth = req.body;
        const error: Result = validationResult(req);

        if (!error.isEmpty()) {
            return res.status(400).json({status: 'err', msg: error});
        }


        const user: any = await User.findOne({
            where: {email}
        });
        if (!user) {
            return res.json({status: 'err', msg: 'Користувач не знайдений !'});
        }

        let comparePassword = bcrypt.compareSync(password, user.password);
        if (!comparePassword) {
            return res.json({status: 'err', msg: 'Неправильний пароль !'});
        }
        
        const token: string = generateJwt(user.id, user.name, user.email, user.role);

        return res.json({token, status: 'ok', msg: 'Вітаємо !'});
    } catch (err: any) {
        next(err);
    };
}; 

const check = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    const token: string = generateJwt(req.user.id, req.user.name, req.user.email, req.user.role);
    return res.json({token});
};

export default {
    registration,
    login,
    check
};