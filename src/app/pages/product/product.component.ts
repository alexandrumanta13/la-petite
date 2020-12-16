import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, AbstractControl, ValidatorFn } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CartService } from '../cart/cart.service';
import { ProductService } from './product.service';
import { v4 as uuidv4 } from 'uuid';
import { ToastrService } from 'ngx-toastr';

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
  private _categoryRoute: string;
  private _productRoute: string;
  product: any;
  productCategoryName: any;
  productCategorySlug: any;
  price: number;
  portions: any;
  isActive: number;
  accessories: any;
  cartQuantity: number = 1;


  /**
   * Constructor
   *
   * @param {ProductService} _ProductService
   * @param {ActivatedRoute} _route
   * @param {Router} router
   * @param {CartService} _cartService
   * 
   */

  constructor(
    private _route: ActivatedRoute,
    private _ProductService: ProductService,
    private _cartService: CartService,
    public router: Router,
    private toaster: ToastrService
  ) { }

  ngOnInit(): void {
    this.formGroup = new FormGroup({
      activeEndDate: new FormControl(new Date(), { validators: [Validators.required, DateTimeValidator] })
    }, { updateOn: 'change' });

    this._route.paramMap.subscribe(params => {
      this._categoryRoute = params.get('categorySlug');
      this._productRoute = params.get('productSlug');
    });

    this._ProductService.getProduct(this._productRoute).then(data => {
      console.log(data)
      this.product = data;
      this.product.accessories = [];
      this.product.selectedAccessories = '';
      this.productCategoryName = this.product.categories[0].category_name;
      this.productCategorySlug = this.product.categories[0].slug;
      this.price = parseInt(this.product.information[0].price);
      this.portions = this.product.information[0].portions;
      this.isActive = this.product.information[0].id;
      this.product.selectedQnt = this.product.information[0].quantity + this.product.information[0].um;
    });

    this._ProductService.getAccesories().then(data => {
      this.accessories = data;
    });
  }

  addDeliveryDate(date) {
    this.product.deliverydate = `${date.day + '.' + date.month + '.' + date.year + '-' + date.hour + ':' + date.minute}`;
    //this.product.deliverydate = date;
  }

  addToCart(product) {
    console.log(this.price)

    if(this.product.deliverydate) {
      this.product.selectedPrice = this.price;
      product.cart_uuid = uuidv4();
      this._cartService.addToCart(product, this.cartQuantity);
    } else {
      this.toaster.info(`${product.product_name + ' ' + product.selectedQnt}`, 'Va rugam sa adaugati data livrarii!', {
        timeOut: 3000,
        positionClass: 'toast-bottom-right'
      });
    }
    
  }

  selectQnt(qnt) {
    this.isActive = qnt.id;
    this.price = parseInt(qnt.price);
    this.portions = qnt.portions;
    this.product.selectedQnt = qnt.quantity + qnt.um;
  }

  addAccessory(event, product, accessory) {
    
    const existing = product.accessories.findIndex(obj => obj.id === accessory.id);
    if(existing > -1) {
      product.accessories = product.accessories.filter(item => item.id !== accessory.id);
      this.price -= 10;
    } else {
      product.accessories.push(accessory);
      this.product.selectedAccessories += accessory.accessory_name + ', '
      this.price += 10;
    }
    console.log(this.product)
    event.target.classList.toggle('active');
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

    $('.tabs-box .tab-buttons .tab-btn').on('click', function (e) {
      e.preventDefault();
      var target = $($(this).attr('data-tab'));

      if ($(target).is(':visible')) {
        return false;
      } else {
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
