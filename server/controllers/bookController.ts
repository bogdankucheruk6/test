import { NextFunction, Request, Response } from 'express';
import { Model, where } from 'sequelize';
import { User, Book, BookInfo } from '../models/model';
import { ModelBook } from '../types/modelTypes/modelTypes';
import { ReqBodyCreateBook, ResBook, ResBookInfo } from '../types/controllerTypes/bookTypes';

const createBook = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const {name, title, description, text}: ReqBodyCreateBook = req.body;
        const result: Model<ModelBook> & any | null = await Book.create({name, author: req.user.name, title, userId: req.user.id});

        await BookInfo.create({bookId: result.id, description, text});

        return res.json({msg: 'Книгу було успішно додано !'});
    } catch (err: any) {
        next(err);
    }
};

const getBooksByUser = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const result: Model<ModelBook>[] | null = await Book.findAll({
            where: {
                userId: req.user.id
            }
        });
        
        return res.json(result);
    } catch (err: any) {
        next(err);
    };
};

const getBooksByManager = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {

        const userIds: Array<number> = [];
        const users = await User.findAll({
            where: {
                managerId: req.user.id
            }
        });

        users.forEach((user: any) => {
            userIds.push(user.id);
        });

        const result: Model<ModelBook>[] | null = await Book.findAll({
            where: {
                userId: userIds
            }
        });
        
        return res.json(result);
    } catch (err: any) {
        next(err);
    };
};

const getBooksByAdmin = async (req: Request, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const result: Model<ModelBook>[] | null = await Book.findAll();
        
        return res.json(result);
    } catch (err: any) {
        next(err);
    };
};

const deleteBook = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const {id} = req.body;

        await Book.destroy({
            where: {
                id
            },
        });

        return res.json({status: 'ok', msg: 'Книгу успішно видалено !'});
    } catch (err: any) {
        next(err);
    }
};

const updateBook = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const {id, name, title, description, text} = req.body;
        await Book.update(
            {name, author: req.user.name, title, userId: req.user.id},
            {
                where: {
                    id
                }
            }
        );

        await BookInfo.update(
            {description, text},
            {
                where: {
                    bookId: id
                }
            }
        );
        

        return res.json({status: 'err', msg: 'Ви успішно оновили книгу !'});
    } catch (err: any) {
        next(err);
    }
};

const getBook = async (req: any, res: Response, next: NextFunction) :Promise<Response | void> => {
    try {
        const id: string = req.params.id;
        const result: Model<ModelBook> & any = await Book.findOne({
            where: {
                id,
                userId: req.user.id
            },
            include: ['book_info']
        });

        if (!result) {
            return res.json({ status: 'err', msg: 'Данної сторінки не існує' });
        }

        const {name, author, title}: ResBook = result;
        const {text, description}: ResBookInfo = result.book_info

        return res.json({
            id,
            name,
            author,
            title,
            text,
            description
        });
    } catch (err: any) {
        next(err);
    }
};

export default {
    createBook,
    getBooksByUser,
    getBooksByManager,
    getBooksByAdmin,
    deleteBook,
    updateBook,
    getBook
}