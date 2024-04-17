import * as express from "express";
import { Request, Response } from "express";
import * as cors from "cors";
import * as bodyParser from "body-parser";
import { UsersRoutes } from "./routes/users";

import { TripsRoutes } from "./routes/trips";
import { TagsRoutes } from "./routes/tags";
import { NationalParksRoutes } from "./routes/nationalParks";

const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true
  })
);

app.use("/users", UsersRoutes);
app.use("/trips", TripsRoutes);
app.use("/tags", TagsRoutes);
app.use("/nationalParks", NationalParksRoutes);

app.all("/*", (request: Request, response: Response, next: any) => {
  (response as any).status(404).send("not found");
});

const port = process.env.PORT || process.argv[2] || 3000;
const host = "localhost";

app.listen(port, () => {
  console.log(`Listening: http://${host}:${port}`);
});
