import { Request, Response, Router } from "express";
import database from "../utils/mysql";
import { JsonPlaceholderRequest } from "./../utils/request";

const router = Router();

router.get("/:userId", async (request: Request, response: Response, next) => {
  const userId = request.params.userId;
  try {
    const users = await database.executeQuery(`select * from User where Email = ?;`, [userId])

    if(users.length > 0) {
      response.status(200).json(users[0]);
    } else {
      throw new Error(`No trip ${userId} found`);
    }
  } catch (error) {
    console.error(error);
    (response as any).status(500).json({
      ok: false,
      error: error.message
    });
  }
});

router.get("/:userId/trips", async (request: Request, response: Response, next) => {
  const userId = request.params.userId;
  try {
    const user = await database.executeQuery(`
      select Trip.*, TripDifficulty.Difficulty as TripDifficulty, NationalPark.Name as NationalParkName from UserTrip
      inner join Trip on UserTrip.TripId = Trip.Id
      inner join TripDifficulty on Trip.TripDifficultyId = TripDifficulty.Id
      inner join NationalPark on Trip.NationalParkId = NationalPark.Id
      where UserTrip.UserId = ?;
    `, [userId])
    response.status(200).json(user);
  } catch (error) {
    console.error(error);
    (response as any).status(500).json({
      ok: false,
      error: error.message
    });
  }
});

// Get users favorited trips
router.get("/:userId/trips/favorites", async (request: Request, response: Response, next) => {
  const userId = request.params.userId;
  try {
    const favoritedTrips = await database.executeQuery(`
      select Trip.* from TripFavorite
      inner join Trip on Trip.Id = TripFavorite.TripId
      where TripFavorite.UserId = ?
      order by TripFavorite.CreatedOn desc;
    `, [userId]);

      response.status(200).json(favoritedTrips);
  } catch (error) {
    console.error(error);
    (response as any).status(500).json({
      error: error.message
    });
  }
});


/**
* @api {get} /users Request All Users Information
* @apiName ExpressTypescriptServer
* @apiGroup Users
*
* @apiSuccessExample Success-Response:
* {
*   "ok": true,
*   "user": ["awillenbrink", "panderson"]
*  }
* 
* @apiSampleRequest http://localhost:3001/users
*/
router.get("", async (request: Request, response: Response, next) => {
  try {
    const users = await database.executeQuery("select * from User");
    // const users = ["awillenbrink", "panderson"];
    response.status(200).json(users);
  } catch (error) {
    console.error(error);
    (response as any).status(500).json({
      ok: false,
      error: error.message
    });
  }
});


/**
* @api {post} /users Add New User
* @apiName ExpressTypescriptServer
* @apiGroup Users
*
* @apiParam {String} username Username of the User.
*
* @apiSuccessExample Success-Response:
* {
*   "ok": true,
*   "user": {
        "id": 123,
*       "username": "awillenbrink"
*     }
*   }
* 
* @apiSampleRequest http://localhost:3001/users
*/
router.post("", async (request: Request, response: Response, next) => {
  const newUser = request.body;
  try {
    // const newUser = await JsonPlaceholderRequest.request(`users`, {
    //   method: "POST",
    //   formData: newUserBody,
    //   json: true
    // });
    (response as any).status(201).json({
      ok: true,
      user: newUser
    });
  } catch (error) {
    console.error(error);
    (response as any).status(500).json({
      ok: false,
      error: error.message
    });
  }
});

router.patch("/:userId", async (request: Request, response: Response, next) => {
  const userId = request.params.userId;
  const updateUserBody = request.body;
  try {
    const updatedUser = await JsonPlaceholderRequest.request(
      `users/${userId}`,
      {
        method: "PATCH",
        body: updateUserBody,
        json: true
      }
    );
    (response as any).status(204).json({
      ok: true,
      user: updatedUser
    });
  } catch (error) {
    console.error(error);
    (response as any).status(500).json({
      ok: false,
      error: error.message
    });
  }
});

export const UsersRoutes: Router = router;
