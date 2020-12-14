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
    path: 'contact', component: ContactComponent,
    data: {
      title: 'Contact',
      description: '',
      ogUrl: 'your og url'
    }
  },
  { path: '404', component: NotFoundComponent },

  { path: 'mesaj-trimis', component: ThankYouComponent },

  { path: '**', redirectTo: '/404' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
