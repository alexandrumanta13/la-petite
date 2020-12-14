import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from './cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})

export class CartComponent implements OnInit {
  @Input() productNum: number;

  constructor(
    public router: Router,
    private cartService: CartService,) { }

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

  emptyCart() {
    this.cartService.emptyCart();
  }

  addToCart(product, event, isBlur: boolean = false) {
    if(isBlur) {
      this.cartService.addToCart(product, event.target.value);
    } else {
      this.cartService.addToCart(product, event);
    }
  }

  addOneToCart(product) {
    console.log(product)
    this.cartService.addToCart(product, product.num + 1);
  }

  removeOneFromCart(product) {
    this.cartService.addToCart(product, product.num - 1);
  }


}
