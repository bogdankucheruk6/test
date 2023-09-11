import {Router} from 'express';
import bookRouter from './bookRouter';
import userRouter from './userRouter';

const router = Router();

router.use('/book', bookRouter);
router.use('/user', userRouter);

export = router;