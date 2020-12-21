import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { from } from 'rxjs';
import { CartService } from '../cart/cart.service';
import { ToastrService } from 'ngx-toastr';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';



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
    private toaster: ToastrService,
    public router: Router,
  ) { }

  private SEND_ORDER = "https://la-petite.ro/data/sendOrder.php";
  private ADD_ORDER = "https://la-petite.ro/la-petite-api/v1/order/add";
  public items$ = this.cartService.items$;
  public products;
  public totalPrice$;
  model: any = {};

  form = new FormGroup({
    name: new FormControl('', [Validators.required, Validators.minLength(3)]),
    email: new FormControl('', [Validators.required, Validators.email, Validators.pattern(new RegExp("[A-Za-z0-9._%-]+@[A-Za-z0-9._%-]+\\.[a-z]{2,3}"))]),
    phone: new FormControl('', [Validators.required, Validators.pattern(new RegExp("[0-9 ]{10}"))]),
    body: new FormControl('', Validators.required),
    categories: new FormControl('', Validators.required)
  });

  get f() {
    return this.form.controls;
  }

  ngOnInit(): void {
    this.items$.subscribe(data => {
      this.products = data
    })

    console.log(this.products)

    this.cartService.totalPrice.subscribe(info => {
      this.totalPrice$ = info;
      if(this.totalPrice$ < 100) {
        this.router.navigate(['/cos-cumparaturi']);
      }
    });
  }

  send() {
    this.ngForm.ngSubmit.emit();
  }

  placeOrder(form: NgForm) {

    // if (!form.errors) {
    //   this.toaster.warning('Va rugam sa completati toate campurile obligatorii!', 'Comanda nu poate fi trimisa!', {
    //     timeOut: 3000,
    //     positionClass: 'toast-bottom-right'
    //   });
    //   return;
    // }

    this.order = [
      {
        customer: {
          firstName: form.value.firstName,
          lastName: form.value.lastName,
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

    console.log(this.order);

    // this._httpClient.post(this.SEND_ORDER, this.order).subscribe((data: any) => {
    //   if (data.status == "success") {

    //     this.toaster.success('Va multumim!', `${data.message}`, {
    //       timeOut: 3000,
    //       positionClass: 'toast-bottom-right'
    //     });

    //     // this.cartService.emptyCart();
    //     // form.reset();
    //   }
    // })

   
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
