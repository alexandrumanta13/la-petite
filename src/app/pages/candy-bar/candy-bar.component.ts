import { Component, OnInit } from '@angular/core';
import { version } from 'process';

@Component({
  selector: 'app-candy-bar',
  templateUrl: './candy-bar.component.html',
  styleUrls: ['./candy-bar.component.scss']
})
export class CandyBarComponent implements OnInit {
  candyBar: any;

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
        ]
      }
    ]
  }

  ngOnInit(): void {
    console.log(this.candyBar)
  }

}
