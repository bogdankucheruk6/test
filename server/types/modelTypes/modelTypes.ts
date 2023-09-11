type ModelUser = {
    name: string
    email: string,
    password: string,
    role: string,
    managerId?: number
}

type ModelBook = {
    id: any,
    userId?: number,
    name: string,
    author: string,
    title: string,
}

type ModelBookInfo = {
    id: any,
    bookId: number;
    description: string;
    text: string;
}

export {
    ModelUser,
    ModelBook,
    ModelBookInfo
}