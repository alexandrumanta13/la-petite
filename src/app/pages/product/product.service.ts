import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Product } from './product.model'

@Injectable({
    providedIn: 'root'
})
export class ProductService {

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

    public getProduct(productSlug): Promise<any> {

        return new Promise((resolve, reject) => {
            this._httpClient.get<Product[]>(this.REST_API_SERVER + 'product/' + productSlug)
                .subscribe((response: any) => {
                    resolve(response);
                }, reject);
        });
    }

    /**
     * Get category
     *
     * @returns {Promise<any>}
     */

    public getCategory(categorySlug): Promise<any> {

        return new Promise((resolve, reject) => {
            this._httpClient.get<Product[]>(this.REST_API_SERVER + 'category/' + categorySlug)
                .subscribe((response: any) => {
                    resolve(response);
                }, reject);
        });
    }

    /**
     * Get accesories
     *
     * @returns {Promise<any>}
     */

    public getAccesories(): Promise<any> {

        return new Promise((resolve, reject) => {
            this._httpClient.get<Product[]>(this.REST_API_SERVER + 'accessories')
                .subscribe((response: any) => {
                    resolve(response);
                }, reject);
        });
    }
}
