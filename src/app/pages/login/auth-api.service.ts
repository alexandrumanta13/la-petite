import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';




@Injectable()
export class AuthAPIService {
  private API_LOGIN = "https://la-petite.ro/la-petite-api/v1/";

  constructor(private _httpClient: HttpClient) {
    console.log('Hello AuthService Provider');
  }

  public postData(credentials, type): Promise<any> {
    return new Promise((resolve, reject) => {
      const headers = new HttpHeaders();
      this._httpClient.post(this.API_LOGIN + type, JSON.stringify(credentials))
        .subscribe((response: any) => {
          resolve(response);
        }, reject);
    });
  }
}