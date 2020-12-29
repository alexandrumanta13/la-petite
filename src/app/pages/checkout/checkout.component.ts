import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { from } from 'rxjs';
import { CartService } from '../cart/cart.service';
import { ToastrService } from 'ngx-toastr';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ThrowStmt } from '@angular/compiler';



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
  show: boolean = false;

  private CHECK_COUPON = "https://la-petite.ro/la-petite-api/v1/coupon/check";
  private USE_COUPON = "https://la-petite.ro/la-petite-api/v1/coupon/use";

  discountCode: any;
  deliverydate: string;
  interval: any;


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


  formGroup: FormGroup;
  dateModel: Date = new Date();

  stringDateModel: string = new Date().toString();

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

    this.cartService.totalPrice.subscribe(info => {
      this.totalPrice$ = info;
      if (this.totalPrice$ < 100) {
        this.router.navigate(['/cos-cumparaturi']);
      }
    });

    this.formGroup = new FormGroup({
      activeEndDate: new FormControl(new Date(), { validators: [Validators.required, DateTimeValidator] })
    }, { updateOn: 'change' });
  }

  send() {
    this.ngForm.ngSubmit.emit();
  }

  toggle() {
    this.show = !this.show;
  }

  getData() {
    return JSON.parse(localStorage.getItem('discountApplied'));
  }

  checkDiscount() {
    if (this.model.email) {
      this._httpClient.post(this.CHECK_COUPON, { email: this.model.email, coupon: this.discountCode }).subscribe((data: any) => {
        if (data.success === true) {

          this.discount = data.percent;
          this.totalPrice$ = this.totalPrice$ - (this.totalPrice$ * this.discount / 100);
          this.toaster.success('Iti multumim!', `${data.message}`, {
            timeOut: 3000,
            positionClass: 'toast-bottom-right'
          });
        } else {
          this.toaster.warning('', `${data.message}`, {
            timeOut: 3000,
            positionClass: 'toast-bottom-right'
          });
        }
      })
    } else {
      this.toaster.warning('', 'Te rugam sa introduci adresa de email!', {
        timeOut: 3000,
        positionClass: 'toast-bottom-right'
      });
    }

  }


  addDeliveryDate(date) {
    console.log(date)
    console.log(date.interval)

    this.deliverydate = `${date.datetime.day + '.' + date.datetime.month + '.' + date.datetime.year}`;
    this.interval = date.interval;
  }



  placeOrder(f: NgForm) {

    // if (!form.errors) {
    //   this.toaster.warning('Va rugam sa completati toate campurile obligatorii!', 'Comanda nu poate fi trimisa!', {
    //     timeOut: 3000,
    //     positionClass: 'toast-bottom-right'
    //   });
    //   return;
    // }

    if (!this.deliverydate) {
      this.toaster.warning('Comanda nu poate fi trimisa!', 'Te rugam sa alegi data livraii!', {
        timeOut: 3000,
        positionClass: 'toast-bottom-right'
      });
      return;
    }

    if (!this.interval) {
      this.toaster.warning('Comanda nu poate fi trimisa!', 'Te rugam sa alegi intervalul de livrare!',  {
        timeOut: 3000,
        positionClass: 'toast-bottom-right'
      });
      return;
    }

    if (!this.payment) {
      this.toaster.warning('Comanda nu poate fi trimisa!', 'Te rugam sa alegi metoda de plata!', {
        timeOut: 3000,
        positionClass: 'toast-bottom-right'
      });
      return;
    }

    this.order = [
      {
        customer: {
          firstName: this.model.firstName,
          lastName: this.model.lastName,
          email: this.model.email,
          phone: this.model.phone,
          shippingAddress: {
            address: this.model.address + ' ' + this.model.address_1,
            town: this.model.town_city,
            county: this.model.county,
            zip: this.model.zip
          }
        },
        total: this.totalPrice$,
        discount: this.discount,
        method: this.payment,
        notes: this.note_box,
        products: this.products,
        accessories: this.products[0].accessories,
        deliverydate: this.deliverydate,
        interval: this.interval
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

            this.toaster.success('Iti multumim!', `${data.message}`, {
              timeOut: 3000,
              positionClass: 'toast-bottom-right'
            });

            if(this.discount > 0) {
              this._httpClient.post(this.USE_COUPON, {email: this.model.email, coupon: this.discountCode}).subscribe((data: any) => {
                if (data.success === true) {
                  this.toaster.success('Iti multumim!', `${data.message}`, {
                    timeOut: 3000,
                    positionClass: 'toast-bottom-right'
                  });
                } 
              })
            }

            this.cartService.emptyCart();
            f.reset();
          }
        })
      }
    });
  }
}

export const DateTimeValidator = (fc: FormControl) => {
  const date = new Date(fc.value);
  const isValid = !isNaN(date.valueOf());
  return isValid ? null : {
    isValid: {
      valid: false
    }
  };
};
