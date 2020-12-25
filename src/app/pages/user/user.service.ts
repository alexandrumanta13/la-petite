import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { User } from './user.model';
@Injectable()
export class UserService {
  constructor(public router: Router) { }

  user = new BehaviorSubject<User>(null);

  async storeData(data) {
    localStorage.setItem('userData', JSON.stringify(data));
    this.user = new BehaviorSubject<User>(null);
    const newData = await this.getData();
    return this.router.navigate(['/'], newData);
  }

  getData() {
    return JSON.parse(localStorage.getItem('userData'));
  }

  sessionIn() {
    let A;
    if (this.getData()) {
      A = this.router.navigate(['/'], this.getData());
    }
    return A;
  }

  sessionOut() {
    let A;
    if (!this.getData()) {
      A = this.router.navigate(['']);
    }
    return A;
  }

  logOut() {
    localStorage.setItem('userData', '');
    localStorage.clear();
    return this.router.navigate(['']);
  }

  
}