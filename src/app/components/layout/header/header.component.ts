import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { map, take } from 'rxjs/operators';
import { CartService } from 'src/app/pages/cart/cart.service';
declare var $: any;
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  open: boolean;
  submenuOpen: boolean;
  public items$ = this._cartService.items$;
  public cartTotal$;
  public totalPrice$;
  cartProducts: any;

  constructor(private router: Router, private _cartService: CartService) { }

  ngOnInit(): void { 
    $('.mobile-menu li.dropdown .dropdown-btn').on('click', function() {
     
      $(this).toggleClass('open');
      $(this).prev('ul').slideToggle(500);
    });

    this.getProducts();

    this._cartService.numTotal.subscribe(info => {
      console.log(info)
      this.cartTotal$ = info;
    })
  }

  toggleMenu() {
    this.open = !this.open;
  }

  getProducts() {
    this.items$.pipe(
      take(1),
      map((products) => {
        this.cartProducts = products;
        this.cartTotal$;
      }),
    ).subscribe();
  }


  // removeCart(product) {
  //   this._cartService.removeFromCart(product);
  //   this.getProducts();
  // }

  // onLogout() {
  //   this.authService.logout();
  // }

  // ngOnDestroy() {
  //   this.userSub.unsubscribe();
  // }
}
