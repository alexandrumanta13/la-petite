import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';



import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/layout/header/header.component';
import { FooterComponent } from './components/layout/footer/footer.component';


import { HomeComponent } from './pages/home/home.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { ServiceWorkerModule } from '@angular/service-worker';
import { environment } from '../environments/environment';


import { ContactComponent } from './pages/contact/contact.component';
import { GdprComponent } from './pages/gdpr/gdpr.component';
import { ConfidentialityComponent } from './pages/confidentiality/confidentiality.component';
import { CookiesComponent } from './pages/cookies/cookies.component';
import { TermsComponent } from './pages/terms/terms.component';
import { ThankYouComponent } from './components/thank-you/thank-you.component';
import { WhatsappComponent } from './components/whatsapp/whatsapp.component';
import { SliderComponent } from './pages/home/slider/slider.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CarouselModule } from 'ngx-owl-carousel-o';
import { SidebarComponent } from './components/sidebar/sidebar.component';

import { ProductSidebarComponent } from './components/layout/product-sidebar/product-sidebar.component';
import { PreloaderComponent } from './components/preloader/preloader.component';
import { MobileMenuComponent } from './components/mobile-menu/mobile-menu.component';
import { ShopSectionComponent } from './components/layout/shop-section/shop-section.component';
import { PromotionSectionComponent } from './components/layout/promotion-section/promotion-section.component';
import { PhotoGalleryComponent } from './components/layout/photo-gallery/photo-gallery.component';
import { TestimonialsComponent } from './components/layout/testimonials/testimonials.component';
import { ProductComponent } from './pages/product/product.component';


import { DatetimepickerComponent } from './components/datetimepicker/datetimepicker.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


import {
  NgbDateAdapter, NgbDateParserFormatter, NgbDatepickerModule, NgbDropdownModule,
  NgbDateNativeAdapter, NgbDate
} from "@ng-bootstrap/ng-bootstrap";
import { ProductsComponent } from './pages/products/products.component';
import { CartComponent } from './pages/cart/cart.component';
import { ToasterComponent } from './components/toaster/toaster.component'
import { ToasterContainerComponent } from './components/toaster/toaster-container.component';
import { ToastrModule } from 'ngx-toastr';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,

    HomeComponent,
    NotFoundComponent,

    ContactComponent,
    GdprComponent,
    ConfidentialityComponent,
    CookiesComponent,
    TermsComponent,
    ThankYouComponent,
    WhatsappComponent,
    SliderComponent,
    SidebarComponent,
    ProductSidebarComponent,
    PreloaderComponent,
    MobileMenuComponent,
    ShopSectionComponent,
    PromotionSectionComponent,
    PhotoGalleryComponent,
    TestimonialsComponent,
    ProductComponent,
    DatetimepickerComponent,
    ProductsComponent,
    CartComponent,
    ToasterComponent,
    ToasterContainerComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule,
    
    ServiceWorkerModule.register('ngsw-worker.js', { enabled: environment.production }),
    BrowserAnimationsModule,
    CarouselModule,
    NgbModule,
    ToastrModule.forRoot(), 
  ],
  exports: [],
  providers: [{ provide: NgbDateAdapter, useClass: NgbDateNativeAdapter },],
  bootstrap: [AppComponent]
})
export class AppModule { }
