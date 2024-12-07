import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { ProductsComponent} from './products/products.component';
export const routes: Routes = [
 { path: '', component: HomeComponent }, // Default ruta
 { path: 'about', component: AboutComponent }, // /about prikazuje AboutComponent
 { path:'products',component:ProductsComponent},
 { path: '**', redirectTo: '', pathMatch: 'full' } // Fallback ruta
];
@NgModule({
imports: [RouterModule.forRoot(routes)],
 exports: [RouterModule]
})
export class AppRoutingModule { }
