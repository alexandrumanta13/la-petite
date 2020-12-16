import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { from } from 'rxjs';
import { CartService } from '../cart/cart.service';
import { ToastrService } from 'ngx-toastr';


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
  accessories: any;

  constructor(
    private cartService: CartService,
    private _httpClient: HttpClient,
    private toaster: ToastrService
  ) { }

  private SEND_ORDER = "https://la-petite.ro/data/sendOrder.php";
  private ADD_ORDER = "https://la-petite.ro/la-petite-api/v1/order/add";
  public items$ = this.cartService.items$;
  public products;
  public totalPrice$;

  ngOnInit(): void {
    this.items$.subscribe(data => {
      this.products = data
    })

    console.log(this.products)

    this.cartService.totalPrice.subscribe(info => {
      this.totalPrice$ = info;
    });
  }

  send() {
    this.ngForm.ngSubmit.emit();
  }

  placeOrder(form: NgForm) {

    if (!form.valid) {
      this.toaster.warning('Va rugam sa completati toate campurile obligatorii!', 'Comanda nu poate fi trimisa!', {
        timeOut: 3000,
        positionClass: 'toast-bottom-right'
      });
      return;
    }

    this.order = [
      {
        customer: {
          firstName: form.value.first_name,
          lastName: form.value.last_name,
          email: form.value.email,
          phone: form.value.phone,
          shippingAddress: {
            address: form.value.address + ' ' + form.value.address_1,
            town: form.value.town_city,
            county: form.value.county,
            zip: form.value.zip
          }
        },

        total: this.totalPrice$,
        discount: this.discount,
        method: this.payment,
        notes: this.note_box,
        products: this.products,
        accessories: this.products[0].accessories
      }
    ];

    this._httpClient.post(this.ADD_ORDER, this.order).subscribe((data: any) => {
      if (data.status == "success") {
        this._httpClient.post(this.SEND_ORDER, this.order).subscribe((data: any) => {
          if (data.status == "success") {

            this.toaster.success('Va multumim!', `${data.message}`, {
              timeOut: 3000,
              positionClass: 'toast-bottom-right'
            });

            this.cartService.emptyCart();
            form.reset();
          }
        })
      }
    });
  }
}
