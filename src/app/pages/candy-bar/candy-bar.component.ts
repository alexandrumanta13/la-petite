import { Component, OnInit } from '@angular/core';
import { version } from 'process';

@Component({
  selector: 'app-candy-bar',
  templateUrl: './candy-bar.component.html',
  styleUrls: ['./candy-bar.component.scss']
})
export class CandyBarComponent implements OnInit {
  candyBar: any;
  selectNoPerson: any;
  selectedPrice: number;
  price: number;
  noPersons: any;


  constructor() {
    this.candyBar = [
      {
        version: [
          {
            title: 'Mini Blanche',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Tarte midi ciocolată și fructe',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Macarons diferite arome',
            description: 'x numarul de invitați'
          },
          {
            title: 'Pavlova',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Mini Ecler ciocolată',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Mini Ecler vanilie',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Cupcakes',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Panna Cotta',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Cake-Pops',
            description: '1/2 din numărul de invitați'
          },
        ],
      },
      {
        version: [
          {
            title: 'Mini Cheesecake borcan',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Macarons diferite arome',
            description: 'x numărul de invitați'
          },
          {
            title: 'Pavlova',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Tiramisu pahar',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Mini Ecler zmeură',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Mini tarte bezea și lămâie',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Mini Pistache',
            description: '1/4 din numărul de invitați'
          },
          {
            title: 'Mini Ecler cafea',
            description: '1/3 din numărul de invitați'
          },
          {
            title: 'Cake-Pops',
            description: '1/2 din numărul de invitați'
          },
        ]
      },
      {
        version: [
          {
            title: 'Cupcakes',

            description: '1/4 din numărul de invitați',
          },
          {
            title: 'Macarons diferite arome',

            description: 'x numărul de invitați',
          },
          {
            title: 'Pavlova',

            description: '1/4 din numărul de invitați',
          },
          {
            title: 'Mini Ecler fistic',

            description: '1/3 din numărul de invitați',
          },
          {
            title: 'Mini Ecler pralina',

            description: '1/3 din numărul de invitați',
          },
          {
            title: 'Mini Le Praliné',

            description: '1/4 din numărul de invitați',
          },
          {
            title: 'Mini Cheesecake fructe de pădure',

            description: '1/4 din numărul de invitați',
          },
          {
            title: 'Cake-Pops',

            description: '1/2 din numărul de invitați',
          },
          {
            title: 'Mini Millefeuille',

            description: '1/3 din numărul de invitați',
          },
        ]
      }
    ]
  }




  toggleFlip(event) {
    const parent = event.target.closest('.content-column');
    const flip = document.querySelectorAll('.content-column');

    console.log(flip)

    if(flip.length > 0) {
      
      for(let i in flip) {
        if(flip[i]) {
          console.log(flip[i])
        }
        
      }
    }
    
    parent.classList.toggle('flip');
    this.selectedPrice = this.price;
    this.selectNoPerson = this.noPersons;

    console.log(this.selectedPrice, this.selectNoPerson)
  }

  ngOnInit(): void {
    console.log(this.candyBar)

  }

  chooseNoPersons(event) {
   
    let order = event.target.closest('.menu-actions');
    let price = order.querySelector('.order h3');
    price.innerHTML = event.target.dataset.price;

    this.price = event.target.dataset.price;
    this.noPersons = event.target.value;

    
  }

}
