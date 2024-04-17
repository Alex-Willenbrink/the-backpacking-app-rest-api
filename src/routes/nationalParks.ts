import { Request, Response, Router } from "express";
import database from "../utils/mysql";
import { JsonPlaceholderRequest } from "./../utils/request";

const router = Router();

router.get("", async (request: Request, response: Response, next) => {
    try {
        const nationalParks = await database.executeQuery(`select * from NationalPark;`, []);
        response.status(200).json(nationalParks);
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  router.post("", async (request: Request, response: Response, next) => {
    const nationalParkName = request.body.name;
    
    try {
      const items = await database.executeQuery(`
      call CreateNationalPark(?, @newId);
      `, [nationalParkName]);

        response.status(200).json(items);
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  export const NationalParksRoutes: Router = router;