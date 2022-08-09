import jwt from 'jsonwebtoken';
import usersRepository from '../repository/usersRepository.js';

async function tokenValidator(req, res, next) {
    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');
    const secretKey = process.env.JWT_SECRET;

    try {
        const { id: userId } = jwt.verify(token, secretKey);

        const user = await usersRepository.getUserById(userId);
        if (!user.rowCount) {
            return res.status(404).send('Usuário não encontrado');
        }

        res.locals.userId = userId;

        next();

    } catch (error) {
        return res.status(401).send('Problema na autenticação do usuário');
    }
}

export default tokenValidator;