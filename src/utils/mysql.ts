const mysql = require('mysql2/promise');

class Mysql {
    pool: any;
  
    constructor() {
    //   this.pool = new Pool({
    //     user: process.env.POSTGRES_USERNAME as any,
    //     password: process.env.POSTGRES_PASSWORD as any,
    //     database: process.env.POSTGRES_DATABASE as any,
    //     host: process.env.POSTGRES_HOST as any,
    //     port: process.env.POSTGRES_PORT as any,
    //   });
    // this.pool = mysql.cre

    this.pool = mysql.createPool({
        user: "cloud",
        password: "password",
        database: "backpacking-app",
        host:  "localhost",
        port: 3306,
      });
    }

    async executeQuery(query: string, values: any[] = []): Promise<any> {
        const [rows, fields] = await this.pool
          .query(query, values)
        return rows;
    }
}

const database = new Mysql();
export default database;