import { DataTypes, Model, ModelStatic} from 'sequelize';
import { ModelUser, ModelBook, ModelBookInfo } from '../types/modelTypes/modelTypes';
import sequelize from '../db';

const User: ModelStatic<Model<ModelUser>> = sequelize.define('users', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true, allowNull: false},
    name: {type: DataTypes.STRING, unique: true, defaultValue: 0},
    email: {type: DataTypes.STRING, unique: true, allowNull: false},
    password: {type: DataTypes.STRING, defaultValue: 0},
    role: {type: DataTypes.STRING, allowNull: false, defaultValue: 'user'}
});

const Book: ModelStatic<Model<ModelBook>> = sequelize.define('books', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true, allowNull: false},
    name: {type: DataTypes.STRING, allowNull: false},
    author: {type: DataTypes.STRING, allowNull: false},
    title: {type: DataTypes.STRING, allowNull: false}
});

const BookInfo: ModelStatic<Model<ModelBookInfo>> = sequelize.define('book_info', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true, allowNull: false},
    description: {type: DataTypes.STRING(2047), allowNull: false},
    text: {type: DataTypes.STRING(2047), allowNull: false}
});

User.belongsTo(User, { as: 'Manager', foreignKey: 'managerId' });

User.hasMany(Book);
Book.belongsTo(User);

Book.hasOne(BookInfo);
BookInfo.belongsTo(Book);

export {
    User,
    Book,
    BookInfo
};