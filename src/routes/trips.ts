import { Request, Response, Router } from "express";
import database from "../utils/mysql";
import { JsonPlaceholderRequest } from "./../utils/request";

const router = Router();

router.get("/:tripId", async (request: Request, response: Response, next) => {
    const tripId = request.params.tripId;
    try {
      const trips = await database.executeQuery(`select * from Trip where Id = ?;`, [tripId]);

      if(trips.length > 0) {
        response.status(200).json(trips[0]);
      } else {
        throw new Error(`No trip ${tripId} found`);
      }
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  router.get("/:tripId/items", async (request: Request, response: Response, next) => {
    const tripId = request.params.tripId;
    try {
      const items = await database.executeQuery(`
        select ItemInstance.ItemId, ItemInstance.Quantity, Item.Name from ItemInstance
        inner join Item on Item.Id = ItemInstance.ItemId
        where ItemInstance.TripId = ?;
      `, [tripId]);

        response.status(200).json(items);
      
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  router.get("/:tripId/tags", async (request: Request, response: Response, next) => {
    const tripId = request.params.tripId;
    try {
      const items = await database.executeQuery(`
        select Tag.* from Tag
        inner join TripTag on TripTag.TagId = Tag.Id
        where TripId = ?;
      `, [tripId]);

        response.status(200).json(items);
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  router.post("/:tripId/tags", async (request: Request, response: Response, next) => {
    const tripId = request.params.tripId;
    const tagId = request.body.tagId;
    
    try {
      const items = await database.executeQuery(`
      insert into TripTag (TripId, TagId)
      values (?, ?);
      `, [tripId, tagId]);

        response.status(200).json(items);
    } catch (error) {
      console.error(error);
      (response as any).status(500).json({
        error: error.message
      });
    }
  });

  export const TripsRoutes: Router = router;