import { Component, OnInit } from '@angular/core';
import { SocialAuthService, SocialLoginModule } from "angularx-social-login";
import { FacebookLoginProvider, GoogleLoginProvider } from "angularx-social-login";
import { AuthAPIService } from './auth-api.service';
import { UserService } from '../user/user.service';
import { Observable, Subscription } from 'rxjs';
@Component({
  selector: 'app-login-page',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  providers: [SocialLoginModule, AuthAPIService, UserService]
})
export class LoginComponent implements OnInit {

  public responseData: any;
  public userPostData = {
    email: '',
    name: '',
    provider: '',
    provider_id: '',
    provider_pic: '',
    token: ''
  };

  authObs: Observable<any>;
  private userSub: Subscription;
  isAuthentificated: boolean;

  constructor(private SocialAuthService: SocialAuthService,
    public authAPIService: AuthAPIService,
    public user: UserService) {
    this.user.sessionIn();
  }

  ngOnInit() { 
    console.log(this.user)
  }

  signInWithGoogle(): void {
    this.SocialAuthService.signIn(GoogleLoginProvider.PROVIDER_ID).then(userData => {
      this.apiConnection(userData);
    });;
  }

  signInWithFB(): void {
    this.SocialAuthService.signIn(FacebookLoginProvider.PROVIDER_ID).then(userData => {
      this.apiConnection(userData);
    });;
  }

  signOut(): void {
    this.SocialAuthService.signOut();
  }

  apiConnection(data) {
    console.log(data);
    this.userPostData.email = data.email;
    this.userPostData.name = data.name;
    this.userPostData.provider = data.provider;
    this.userPostData.provider_id = data.id;
    this.userPostData.provider_pic = data.photoUrl;
    this.userPostData.token = data.authToken;

    this.authAPIService.postData(this.userPostData, 'signup').then(
      result => {
        this.responseData = result;
        if (this.responseData.userData) {
          console.log(this.responseData)
          this.user.storeData(this.responseData.userData);
          
        }
      },
      err => {
        console.log('error');
      }
    );
  }

  
}