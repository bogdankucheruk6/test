type ReqBodyCreateBook = {
    name: string,
    title: string,
    description: string,
    text: string,
}

type ResBook = {
    name: string,
    author: string,
    title: string
}

type ResBookInfo = {
    text: string,
    description: string,
}

export {
    ReqBodyCreateBook,
    ResBook,
    ResBookInfo
}