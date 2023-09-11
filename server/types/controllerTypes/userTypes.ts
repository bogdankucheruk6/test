type Error = {
    type: string,
    value: string,
    msg: string,
    path: string,
    location: string
}

type ReqBodyAuth = {
    name: string,
    email: string,
    password: string,
    role: string
}


export {
    Error,
    ReqBodyAuth
}