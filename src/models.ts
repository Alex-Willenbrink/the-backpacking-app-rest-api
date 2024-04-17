interface Base {
    Id: number;
    CreateOn: Date;
}

interface User extends Base {
    Email: string;
}