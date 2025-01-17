import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { KarticaComponent } from './kartica/kartica.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { AdmindashComponent } from './admindash/admindash.component';
import { CartComponent } from './cart/cart.component';

export const routes: Routes = [
{ path: '', redirectTo: '/login', pathMatch: 'full' },
{ path: 'login', component: LoginComponent},
{ path: 'admindash', component: AdmindashComponent },
 { path: 'home', component: HomeComponent },
 { path: 'about', component: AboutComponent },
 { path:'kartica',component: KarticaComponent},
 { path: 'register', component: RegisterComponent},
 { path: 'cart', component: CartComponent },


];
@NgModule({
imports: [RouterModule.forRoot(routes)],
 exports: [RouterModule]
})
export class AppRoutingModule { }
