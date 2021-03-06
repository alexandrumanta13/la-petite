import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AboutComponent } from './pages/about/about.component';
import { HomeComponent } from './pages/home/home.component';

import { ContactComponent } from './pages/contact/contact.component';


import { NotFoundComponent } from './components/not-found/not-found.component';
import { ThankYouComponent } from "./components/thank-you/thank-you.component";



import { GdprComponent } from './pages/gdpr/gdpr.component';
import { ConfidentialityComponent } from './pages/confidentiality/confidentiality.component';
import { CookiesComponent } from "./pages/cookies/cookies.component";
import { TermsComponent } from "./pages/terms/terms.component";
import { ProductComponent } from './pages/product/product.component';
import { ProductsComponent } from './pages/products/products.component';
import { CartComponent } from './pages/cart/cart.component';
import { CheckoutComponent } from './pages/checkout/checkout.component';
import { CandyBarComponent } from './pages/candy-bar/candy-bar.component';
import { LoginComponent } from './pages/login/login.component';
import { HowToBuyComponent } from './pages/how-to-buy/how-to-buy.component';
import { HowToPayComponent } from './pages/how-to-pay/how-to-pay.component';
import { DeliveryInfoComponent } from './pages/delivery-info/delivery-info.component';
import { SuccessOrderComponent } from './pages/success-order/success-order.component';
import { MyAccountComponent } from './pages/my-account/my-account.component';
import { AuthGuard } from './pages/login/auth.guard';
import { AuthAPIService } from './pages/login/auth-api.service';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { JwtInterceptor } from './pages/login/jwt-interceptor';
import { MaintenanceComponent } from './components/maintenance/maintenance.component';
import { MyOrdersComponent } from './pages/my-account/my-orders/my-orders.component';
import { OrderDetailsComponent } from './pages/my-account/order-details/order-details.component';
import { CouponsComponent } from './pages/my-account/coupons/coupons.component';
import { AddressesComponent } from './pages/my-account/addresses/addresses.component';

const routes: Routes = [
  {
    path: '', component: HomeComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: 'La Petite - Douce Revelation este un laborator de cofetarie artizanala din Bucuresti cu deserturi delicioase, din ingrediente naturale. Vezi prajiturile noastre!',
      ogUrl: 'your og url'
    }
  },


  {
    path: 'produs/:categorySlug/:productSlug', component: ProductComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: '',
      ogUrl: 'your og url'
    }
  },


  {
    path: 'produse', component: ProductsComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'candy-bar', component: CandyBarComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'produse/:categorySlug', pathMatch: 'full', component: ProductsComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: '',
      ogUrl: 'your og url'
    }
  },

  {
    path: 'cos-cumparaturi', component: CartComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: '',
      ogUrl: 'your og url'
    }
  },

  {
    path: 'finalizeaza-comanda', component: CheckoutComponent,
    data: {
      title: 'Cofetaria La Petite - Douce Revelation',
      description: '',
      ogUrl: 'your og url'
    }
  },

  {
    path: 'despre-noi', component: AboutComponent,
    data: {
      title: 'Despre noi',
      description: '',
      ogUrl: 'your og url'
    }
  },

  {
    path: 'setari-gdpr', component: GdprComponent,
    data: {
      title: 'Setari GDPR',
      description: '',
      ogUrl: 'your og url'
    }
  },

  {
    path: 'confidentialitate', component: ConfidentialityComponent,
    data: {
      title: 'Confidentialitate',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'politica-cookies', component: CookiesComponent,
    data: {
      title: 'politica cookies',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'termeni-si-conditii', component: TermsComponent,
    data: {
      title: 'Termeni si conditii',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'cum-cumpar', component: HowToBuyComponent,
    data: {
      title: 'Cum cumpar',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'cum-platesc', component: HowToPayComponent,
    data: {
      title: 'Cum platesc',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'info-livrare', component: DeliveryInfoComponent,
    data: {
      title: 'Info livrare',
      description: '',
      ogUrl: 'your og url'
    }
  },
  {
    path: 'contact', component: ContactComponent,
    data: {
      title: 'Contact',
      description: '',
      ogUrl: 'your og url'
    }
  },
  { path: 'login', component: LoginComponent },
  { path: 'autentificare', component: LoginComponent },
  { path: 'contul-meu', component: MyAccountComponent, canActivate: [AuthGuard] },
  { path: 'comenzile-mele', component: MyOrdersComponent, canActivate: [AuthGuard] },
  { path: 'comenzile-mele/:orderUUID', component: OrderDetailsComponent, canActivate: [AuthGuard] },
  { path: 'cupoane-reducere', component: CouponsComponent, canActivate: [AuthGuard] },
  { path: 'adresele-mele', component: AddressesComponent, canActivate: [AuthGuard] },


  { path: '404', component: NotFoundComponent },

  { path: 'comanda-finalizata', component: SuccessOrderComponent },
  { path: 'mesaj-trimis', component: ThankYouComponent },

  { path: '**', redirectTo: '/404' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  providers: [
   // { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    // { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },

    // provider used to create fake backend
    //fakeBackendProvider,
    //{ provide: LOCALE_ID, useValue: "ro-RO" },

    AuthAPIService
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
