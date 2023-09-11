import Router from 'express';
import bookController from '../controllers/bookController';
import roleMiddleware from '../middleware/roleMiddleware';
import authMiddleware from '../middleware/authMiddleware';

const router = Router();

router.post('/createBook', roleMiddleware('user'), bookController.createBook);
router.get('/user/getBooks', roleMiddleware('user'), bookController.getBooksByUser);
router.get('/manager/getBooks', roleMiddleware('manager'), bookController.getBooksByManager);
router.get('/admin/getBooks', roleMiddleware('admin'), bookController.getBooksByAdmin);
router.post('/deleteBook', roleMiddleware('user'), bookController.deleteBook);
router.patch('/updateBook', roleMiddleware('user'), bookController.updateBook);
router.get('/:id', authMiddleware, bookController.getBook);

export = router;