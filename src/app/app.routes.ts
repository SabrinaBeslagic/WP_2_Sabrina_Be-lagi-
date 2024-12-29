import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { KarticaComponent } from './kartica/kartica.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';

export const routes: Routes = [
 { path: '', component: HomeComponent }, // Default ruta
 { path: 'about', component: AboutComponent }, // /about prikazuje AboutComponent
 { path:'kartica',component: KarticaComponent},
 { path: 'login', component: LoginComponent},
 { path: 'register', component: RegisterComponent},
 { path: '**', redirectTo: '', pathMatch: 'full' }// Fallback ruta

];
@NgModule({
imports: [RouterModule.forRoot(routes)],
 exports: [RouterModule]
})
export class AppRoutingModule { }
