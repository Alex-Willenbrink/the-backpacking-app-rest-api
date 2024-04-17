import * as request from "request";

import { Response } from "request";

export class JsonPlaceholderRequest {
  static jsonPlaceholderBaseUrl = "https://jsonplaceholder.typicode.com";

  static request(
    url: string,
    options: {
      method: "GET" | "POST" | "PUT" | "PATCH" | "DELETE";
      formData?: any;
      json?: boolean;
      body?: any;
    },
    urlParameters = {}
  ): Promise<any> {
    options = {
      ...options,
      url,
      headers: { Accept: "application/json" }
    } as any;

    return new Promise((resolve, reject) => {
      request(options as any, (error: any, response: Response, body: any) => {
        if (error) {
          reject(error);
        }
        resolve(body);
      });
    });
  }

  static getUrlQueryString(parameters: any): string {
    return Object.keys(parameters)
      .map(key => {
        return `${key}=${encodeURIComponent(parameters[key])}`;
      })
      .join("&");
  }
}
