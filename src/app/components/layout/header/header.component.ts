import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
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
    $('.mobile-menu li a.dropdown-btn-parent_1').on('click', function() {
     console.log($('.dropdon-list-toggle_1'))
      $(this).next().next().toggleClass('open');
      $('.dropdon-list-toggle_1').slideToggle(500);
    });
    $('.mobile-menu li a.dropdown-btn-parent_2').on('click', function() {
      console.log($('.dropdon-list-toggle_2'))
       $(this).next().next().toggleClass('open');
       $('.dropdon-list-toggle_2').slideToggle(500);
     });

    this.getProducts();

    this._cartService.numTotal.subscribe(info => {
      console.log(info)
      this.cartTotal$ = info;
    });

    this.router.events.subscribe((evt) => {
      if (!(evt instanceof NavigationEnd)) {
        return;
      }
      this.open = false;
      
    });
  }

  toggleMenu() {
    this.open = !this.open;
  }

  goToUrl() {
    
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
