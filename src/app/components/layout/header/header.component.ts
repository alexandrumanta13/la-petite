import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
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
  cartTotal$: any;

  constructor(private router: Router, private _cartService: CartService) { }

  ngOnInit(): void { 
    $('.mobile-menu li.dropdown .dropdown-btn').on('click', function() {
     
      $(this).toggleClass('open');
      $(this).prev('ul').slideToggle(500);
    });

    this._cartService.numTotal.subscribe(info => {
      this.cartTotal$ = info;
    })
  }

  toggleMenu() {
    this.open = !this.open;
  }
}
