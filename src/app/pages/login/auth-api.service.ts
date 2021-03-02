import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { User } from '../user/user.model';
import { BehaviorSubject, Subject, throwError } from 'rxjs';
import { Router } from '@angular/router';
import { catchError, map, tap } from 'rxjs/operators';


export interface AuthResponseData {
  user: User
}

@Injectable({ providedIn: 'root' })
export class AuthAPIService {
  private API_LOGIN = "https://la-petite.ro/la-petite-api/v1/";

  user = new BehaviorSubject<User>(null);

  private tokenExpirationTimer: any;

  constructor(private _httpClient: HttpClient, public _router: Router) {
    
    this.user = new BehaviorSubject<User>(JSON.parse(localStorage.getItem('LaPetiteUser_Data')));
    console.log('Hello AuthService Provider', this.user);
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

  // public signup(user): Promise<any> {
  //   console.log(user)
  //   return new Promise((resolve, reject) => {
  //     const headers = new HttpHeaders();
  //     this._httpClient.post(`https://la-petite.ro/la-petite-api/v1/register`, {  "firstName": user.name, "lastName": user.last_name, "email": user.email, "password": user.password })
  //       .subscribe((data: any) => {
          
  //         resolve(data);
  //       }, reject);
  //   });
  // }

  signup(user) {
    console.log(user)
    return this._httpClient.post<AuthResponseData>(`https://la-petite.ro/la-petite-api/v1/register`, {  "firstName": user.name, "lastName": user.last_name, "email": user.email, "password": user.password })
      .pipe(tap(data => {
        this.handleAuthentication(
          data.user.id,
          data.user.name,
          data.user.last_name,
          data.user.email,
          data.user.provider,
          data.user.provider_id,
          data.user.provider_pic,
          data.user.date_last_visit,
          data.user.access,
          data.user.token
        );
      })
      );
  }



  login(email: string, password: string) {
    
    return this._httpClient.post<AuthResponseData>(this.API_LOGIN + 'login', { email: email,  password: password })
      .pipe(
        tap(data => {
          this.handleAuthentication(
            data.user.id,
            data.user.name,
            data.user.last_name,
            data.user.email,
            data.user.provider,
            data.user.provider_id,
            data.user.provider_pic,
            data.user.date_last_visit,
            data.user.access,
            data.user.token,
          );
        })
      )
  }

  logout() {
    this.user.next(null);
    this._router.navigate(['/autentificare']);
    localStorage.removeItem('LaPetiteUser_Data');
    if (this.tokenExpirationTimer) {
      clearTimeout(this.tokenExpirationTimer);
    }
    this.tokenExpirationTimer = null;
  }

  autoLogout(expirationDuration: number) {
    localStorage.removeItem('LaPetiteUser_Data');
    this.tokenExpirationTimer = setTimeout(() => {
      console.log(expirationDuration)
      this.logout();
    }, expirationDuration);
  }

  autoLogin() {
    const LaPetiteUser_Data: {
      id: number,
      name: string,
      last_name: string,
      email: string,
      provider: string,
      provider_id: string,
      provider_pic: string,
      date_last_visit: Date,
      access: number,
      _token: string;
      _tokenExpirationDate: string;
    } = JSON.parse(localStorage.getItem('LaPetiteUser_Data'));
    if (!LaPetiteUser_Data) {
      return;
    }

    const loadedUser = new User(
      LaPetiteUser_Data.id,
      LaPetiteUser_Data.name,
      LaPetiteUser_Data.last_name,
      LaPetiteUser_Data.email,
      LaPetiteUser_Data.provider,
      LaPetiteUser_Data.provider_id,
      LaPetiteUser_Data.provider_pic,
      LaPetiteUser_Data.date_last_visit,
      LaPetiteUser_Data.access,
      LaPetiteUser_Data._token,
      new Date(LaPetiteUser_Data._tokenExpirationDate)
    );

    if (loadedUser.token) {
      this.user.next(loadedUser);
      const expirationDuration =
        new Date(LaPetiteUser_Data._tokenExpirationDate).getTime() -
        new Date().getTime();
      //this.autoLogout(expirationDuration);

    }
  }

  private handleAuthentication(
    id: number,
    name: string,
    last_name: string,
    email: string,
    provider: string,
    provider_id: string,
    provider_pic: string,
    date_last_visit: Date,
    access: number,
    token: string,

  ) {
    const expirationDate = new Date(date_last_visit);
    expirationDate.setFullYear(expirationDate.getFullYear() + 1);
    const user = new User(
      id,
      name,
      last_name,
      email,
      provider,
      provider_id,
      provider_pic,
      date_last_visit,
      access,
      token,
      expirationDate
    )


    localStorage.setItem('LaPetiteUser_Data', JSON.stringify(user))
    this.user.next(user);
    
    //this.autoLogout(expirationDate.getTime());

    
  }

  private handleError(errorRes: HttpErrorResponse) {
    let errorMessage = 'An unknown error occured!';
    if(!errorRes.error || !errorRes.error.error) {
      return throwError(errorMessage)
    }
    switch(errorRes.error.error.message) {
      case 'EMAIL_EXISTS':
        errorMessage = 'This email exists already!'
    }
    return throwError(errorMessage)
  }
}