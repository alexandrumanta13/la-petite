import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { from } from 'rxjs';
import { CartService } from '../cart/cart.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.scss']
})
export class CheckoutComponent implements OnInit {
  @ViewChild('sendOrder') ngForm: NgForm;
  
  order: any[];
  discount: number = 0;
  payment: any;
  note_box: any;

  constructor(
    private cartService: CartService,
    private _httpClient: HttpClient
  ) { }

  private SEND_ORDER = "https://la-petite.ro/data/sendOrder.php";
  public items$ = this.cartService.items$;
  public products;
  public totalPrice$;

  ngOnInit(): void {
    this.items$.subscribe(data => {
      this.products = data
    })

    this.cartService.totalPrice.subscribe(info => {
      this.totalPrice$ = info;
    });
  }

  send() { 
    this.ngForm.ngSubmit.emit(); 
  }

  placeOrder(form: NgForm) {
   
    if(!form.valid) {
      return;
    }

    this.order = [
      {
        customer: {
          name: form.value.first_name + ' ' + form.value.last_name,
          email: form.value.email,
          phone: form.value.phone,
          address: form.value.address + ' ' + form.value.address_1,
          town: form.value.town_city,
          county: form.value.county,
          zip: form.value.zip
        },
        order_details: {
          total: this.totalPrice$,
          discount: this.discount,
          payment: this.payment,
          notes: this.note_box
        },
        products: this.products 
      }
    ];

    this._httpClient.post(`https://la-petite.ro/data/sendOrder.php`, this.order).subscribe((data: any) => {
      if (data.status == "success") {
        form.reset();
      }
    })
  }
}
