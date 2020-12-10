import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, AbstractControl, ValidatorFn } from '@angular/forms';

declare var $: any;

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent implements OnInit {

  formGroup: FormGroup;
  dateModel: Date = new Date();

  stringDateModel: string = new Date().toString();

  constructor() { }

  ngOnInit(): void {
    this.formGroup = new FormGroup({
      activeEndDate: new FormControl(new Date(), { validators: [Validators.required, DateTimeValidator] })
    }, { updateOn: 'change' });

  }

  addToCart(product) {
    console.log(product)
    // product.selectedQnt = this.selectedQnt;
    // product.selectedColorName = this.selectedColorName;
    // product.selectedColor = this.selectedColor;
    // product.cart_uuid = uuidv4();
    // if (this.selectedColor) {
    //   product.selectedPrice = parseInt(this.price) + 20;
    // } else {
    //   product.selectedPrice = this.price;
    // }
    // const inputValue = (<HTMLInputElement>document.querySelector('.horizontal-quantity')).value;
    // this._cartService.addToCart(product, parseInt(inputValue));

  }




  ngAfterViewInit() {

    $('.product-details-content .bxslider').bxSlider({
      nextSelector: '.product-details-content #slider-next',
      prevSelector: '.product-details-content #slider-prev',
      nextText: '<i class="fa fa-angle-right"></i>',
      prevText: '<i class="fa fa-angle-left"></i>',
      mode: 'fade',
      auto: 'true',
      speed: '700',
      pagerCustom: '.product-details-content .slider-pager .thumb-box'
    });

    $('.tabs-box .tab-buttons .tab-btn').on('click', function(e) {
			e.preventDefault();
			var target = $($(this).attr('data-tab'));
			
			if ($(target).is(':visible')){
				return false;
			}else{
				target.parents('.tabs-box').find('.tab-buttons').find('.tab-btn').removeClass('active-btn');
				$(this).addClass('active-btn');
				target.parents('.tabs-box').find('.tabs-content').find('.tab').fadeOut(0);
				target.parents('.tabs-box').find('.tabs-content').find('.tab').removeClass('active-tab');
				$(target).fadeIn(300);
				$(target).addClass('active-tab');
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
