import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Product } from '../product/product.model'

@Injectable({
    providedIn: 'root'
})
export class ProductsService {

    private REST_API_SERVER = "https://la-petite.ro/la-petite-api/v1/";

    /**
     * Constructor
     *
     * @param {HttpClient} _httpClient
     */

    constructor(private _httpClient: HttpClient) { }

    /**
     * Get products
     *
     * @returns {Promise<any>}
     */

    public getProducts(route, currentPage): Promise<any> {

        return new Promise((resolve, reject) => {
            if (!route) {
                this._httpClient.get<Product[]>(this.REST_API_SERVER + 'products/' + currentPage)
                    .subscribe((response: any) => {
                        resolve(response);
                    }, reject);
            } else {
                this._httpClient.get<Product[]>(this.REST_API_SERVER + 'products/category/' + route + '/page/' + currentPage)
                    .subscribe((response: any) => {
                        resolve(response);
                    }, reject);
            }

        });
    }

    public getProductsLimited(): Promise<any> {
        return new Promise((resolve, reject) => {
            this._httpClient.get<Product[]>(this.REST_API_SERVER + 'limited')
                .subscribe((response: any) => {
                    resolve(response);
                }, reject);
        });
       
    }

    /**
     * Get products
     *
     * @returns {Promise<any>}
     */

    public getCategories(): Promise<any> {

        return new Promise((resolve, reject) => {
            this._httpClient.get<Product[]>(this.REST_API_SERVER + 'categories')
                .subscribe((response: any) => {
                    resolve(response);
                }, reject);
        });
    }

    /**
     * Get products
     *
     * @returns {Promise<any>}
     */

    public getCategory(route): Promise<any> {

        return new Promise((resolve, reject) => {
            this._httpClient.get<Product[]>(this.REST_API_SERVER + 'category/' + route)
                .subscribe((response: any) => {
                    resolve(response);
                }, reject);
        });
    }
}
