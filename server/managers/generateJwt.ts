import jwt from 'jsonwebtoken';

export = (id: number, name: string, email: string, role: string): string => {
    return jwt.sign(
        {id, name, email, role},
        'random_secret_key',
        {expiresIn: '24h'}
    );
};
