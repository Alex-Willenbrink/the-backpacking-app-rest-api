import database  from "../utils/mysql";

(async () => {
    console.log("run scripts here");
    console.log("this is a test");


    const result = await database.executeQuery(`select * from User where Email = ?;`, ["awillenbrink@gmail.com"]);
    console.log(result);
})();