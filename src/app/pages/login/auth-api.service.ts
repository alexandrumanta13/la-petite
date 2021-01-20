import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import { User } from '../user/user.model';
import { BehaviorSubject } from 'rxjs';
import { Router } from '@angular/router';
import { tap } from 'rxjs/operators';

export interface AuthResponseData {
  user: User
}

@Injectable({ providedIn: 'root' })
export class AuthAPIService {
  private API_LOGIN = "https://la-petite.ro/la-petite-api/v1/";

  user = new BehaviorSubject<User>(null);

  private tokenExpirationTimer: any;

  constructor(private _httpClient: HttpClient, public _router: Router) {
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

  signup(email: string, password: string) {
    return this._httpClient.post<AuthResponseData>(`https://pro-staff.ro/prostaff-api/v1/login`, { "email": email, "password": password })
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
    return this._httpClient
      .post<AuthResponseData>(this.API_LOGIN,
        {
          email: email,
          password: password,
        }
      )
      .pipe(
        tap(data => {
          console.log(data)
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
      );
  }

  logout() {
    this.user.next(null);
    this._router.navigate(['/autentificare']);
    localStorage.removeItem('LaPetiteUserData');
    if (this.tokenExpirationTimer) {
      clearTimeout(this.tokenExpirationTimer);
    }
    this.tokenExpirationTimer = null;
  }

  autoLogout(expirationDuration: number) {

    this.tokenExpirationTimer = setTimeout(() => {
      console.log(expirationDuration)
      this.logout();
    }, expirationDuration);
  }

  autoLogin() {
    const LaPetiteUserData: {
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
    } = JSON.parse(localStorage.getItem('LaPetiteUserData'));
    if (!LaPetiteUserData) {
      return;
    }

    const loadedUser = new User(
      LaPetiteUserData.id,
      LaPetiteUserData.name,
      LaPetiteUserData.last_name,
      LaPetiteUserData.email,
      LaPetiteUserData.provider,
      LaPetiteUserData.provider_id,
      LaPetiteUserData.provider_pic,
      LaPetiteUserData.date_last_visit,
      LaPetiteUserData.access,
      LaPetiteUserData._token,
      new Date(LaPetiteUserData._tokenExpirationDate)
    );

    if (loadedUser.token) {
      this.user.next(loadedUser);
      const expirationDuration =
        new Date(LaPetiteUserData._tokenExpirationDate).getTime() -
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
    this.user.next(user);
    //this.autoLogout(expirationDate.getTime());

    localStorage.setItem('LaPetiteUserData', JSON.stringify(user))
  }
}