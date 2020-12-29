import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { FormGroup, FormControl, Validators, FormGroupDirective, NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {

  email: string;
  name: string;
  message: string;
  categories: string;
  endpoint: string;

  http: HttpClient;
  model: any = {};

  @ViewChild(FormGroupDirective) formGroupDirective: FormGroupDirective;

  constructor(http: HttpClient, private router: Router,) {
    
    this.http = http;
  }

  ngOnInit() {
    this.endpoint = "https://la-petite.ro/data/sendEmail.php";
  }

  submit(f: NgForm) {
   
    let postVars = {
      email: this.model.email,
      name: this.model.name,
      phone: this.model.phone,
      subject: this.model.subject,
      message: this.model.message,
    };

 
    console.log(postVars)

    this.http.post(this.endpoint, postVars)
      .subscribe(
        response => {
          f.reset();
          this.router.navigate(['/mesaj-trimis']);
        }
        
      )

  }

}
