import Router from 'express';
import { check } from 'express-validator';
import userController from '../controllers/userController';
import authMiddleware from '../middleware/authMiddleware';

const router = Router();

router.post('/registration', [
    check("name", "Ім'я користувача має бути заповненим").notEmpty(),
    check('email', 'Email не може бути пустим').notEmpty(),
    check('password', 'Мінімум 8 символів, максимум 16').isLength({min: 8, max: 16})
], userController.registration);
router.post('/login', [
    check('email', 'Email не може бути пустим').notEmpty(),
    check('password', 'Мінімум 8 символів, максимум 16').isLength({min: 8, max: 16})
], userController.login);
router.get('/auth', authMiddleware, userController.check);

export = router;