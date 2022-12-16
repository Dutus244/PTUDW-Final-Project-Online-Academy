import knexObj from 'knex';
import * as dotenv from 'dotenv'
dotenv.config()

export default knexObj({
  client: 'mysql2',
  connection: {
    host: 'javachatapplication.mysql.database.azure.com',
    port: '3306',
    user: 'java',
    password: '20Ktpm2022',
    database: 'ptudw_finalproject_onlineacademy'
  }
});