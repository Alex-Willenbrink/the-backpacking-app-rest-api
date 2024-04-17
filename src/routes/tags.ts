import { Request, Response, Router } from "express";
import database from "../utils/mysql";
import { JsonPlaceholderRequest } from "./../utils/request";

const router = Router();

router.get("", async (request: Request, response: Response, next) => {
    try {
        const tags = await database.executeQuery(`select * from Tag;`, []);
        response.status(200).json(tags);
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  export const TagsRoutes: Router = router;