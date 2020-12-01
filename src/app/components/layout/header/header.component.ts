import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
declare var $: any;
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  open: boolean;
  submenuOpen: boolean;

  constructor(private router: Router) { }

  ngOnInit(): void { 
    $('.mobile-menu li.dropdown .dropdown-btn').on('click', function() {
     
      $(this).toggleClass('open');
      $(this).prev('ul').slideToggle(500);
    });
  }

  toggleMenu() {
    this.open = !this.open;
  }
}
