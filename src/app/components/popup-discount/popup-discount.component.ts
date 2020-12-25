import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-popup-discount',
  templateUrl: './popup-discount.component.html',
  styleUrls: ['./popup-discount.component.scss']
})
export class PopupDiscountComponent implements OnInit {
  discount: any;
  showPopup: boolean = true;

  constructor(private _httpClient: HttpClient, private toaster: ToastrService) { }

  private SEND_COUPON = "https://la-petite.ro/la-petite-api/v1/coupon/generate"; 


  ngOnInit(): void {
    if(this.getData() || this.getData() == 'closed') {
      this.showPopup = false;
    }
  }

  sendDiscount() {
    console.log(this.discount)
    this._httpClient.post(this.SEND_COUPON, {email: this.discount}).subscribe((data: any) => {
     
      if (data.success === true) {
        console.log(data.coupon)
        localStorage.setItem('discount', JSON.stringify(data.coupon));
        this.showPopup = false;
        this.toaster.success('Va multumim!', `${data.message}`, {
          timeOut: 3000,
          positionClass: 'toast-bottom-right'
        });
      }
    })
  }

  getData() {
    return JSON.parse(localStorage.getItem('discount'));
  }

  hidePopup() {
    localStorage.setItem('discount', JSON.stringify({closed: 'closed'}));
    this.showPopup = false;
  }

}
