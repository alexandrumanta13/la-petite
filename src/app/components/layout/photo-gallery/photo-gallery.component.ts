import { Component, OnInit } from '@angular/core';
declare var $: any;

@Component({
  selector: 'app-photo-gallery',
  templateUrl: './photo-gallery.component.html',
  styleUrls: ['./photo-gallery.component.scss']
})
export class PhotoGalleryComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    this.enableMasonry();
  }

  enableMasonry() {
    if ($('.sortable-masonry').length) {

      var winDow = $(window);
      // Needed variables
      var $container = $('.sortable-masonry .items-container');
      var $filter = $('.filter-btns');

      $container.isotope({
        filter: '*',
        masonry: {
          columnWidth: '.masonry-item.small-column'
        },
        animationOptions: {
          duration: 500,
          easing: 'linear'
        }
      });


      // Isotope Filter 
      $filter.find('li').on('click', function () {
        var selector = $(this).attr('data-filter');

        try {
          $container.isotope({
            filter: selector,
            animationOptions: {
              duration: 500,
              easing: 'linear',
              queue: false
            }
          });
        } catch (err) {

        }
        return false;
      });


      winDow.on('resize', function () {
        var selector = $filter.find('li.active').attr('data-filter');

        $container.isotope({
          filter: selector,
          animationOptions: {
            duration: 500,
            easing: 'linear',
            queue: false
          }
        });
      });


      var filterItemA = $('.filter-btns li');

      filterItemA.on('click', function () {
        var $this = $(this);
        if (!$this.hasClass('active')) {
          filterItemA.removeClass('active');
          $this.addClass('active');
        }
      });


    }

  }

  ngAfterViewInit() {
    setTimeout(() => {
      let active: HTMLElement = document.querySelector('.filter-tabs .active') as HTMLElement;
      active.click();
    }, 1000);

  }

}
