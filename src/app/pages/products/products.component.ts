import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProductsService } from './products.service';
import { Product } from '../product/product.model'


@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.scss']
})
export class ProductsComponent implements OnInit {

  private _categoryRoute: string;
  public products: any;
  results: any;
  totalPages: any;
  pages: number[];
  currentPage: any;


  /**
   * Constructor
   *
   * @param {ProductsService} _ProductsService
   * @param {ActivatedRoute} _route
   * @param {HttpClient} router
   * @param {MatSnackBar} _httpClient
   */

  constructor(
    private _httpClient: HttpClient,
    private _route: ActivatedRoute,
    public router: Router,
    private _ProductsService: ProductsService) { }

  ngOnInit(): void {
    this._route.paramMap.subscribe(params => {
      this._categoryRoute = params.get('categorySlug');
    });
    this.getProducts();
  }

  getProducts() {
    if (!this._categoryRoute) {
      this._ProductsService.getProducts('', this.currentPage).then(data => {
        this.results = data.total_no_of_products;
        this.products = data.products;
        
        this.setTotalPages(data.no_of_pages);
        this.setPagesArray(this.totalPages);

        console.log(this.products)
      });


    } else {
      this._ProductsService.getProducts(this._route, this.currentPage).then(data => {
        this.results = data.total_no_of_products;
        this.products = data.products;
        
        this.setTotalPages(data.no_of_pages);
        this.setPagesArray(this.totalPages);

        this._ProductsService.getCategory(this._route);

        console.log(this.products)
      });

    }
  }

  getTotalPages() {
    return this.totalPages;
  }

  setTotalPages(page: number) {
    this.totalPages = page;
  }

  setPagesArray(maxPage: number) {
    this.pages = Array(maxPage).fill(0).map((x, i) => i + 1);
  }

  setCurrentPage(page: number) {
    if (this.currentPage <= this.totalPages) {
      this.currentPage = page;
    }
    this.getProducts();
  }

  increaseCurrentPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage += 1;
    }
    this.getProducts();
  }

  decreaseCurrentPage() {
    if (this.currentPage > 1) {
      this.currentPage -= 1;
    }
    this.getProducts();
  }

}
