import { Component } from '@angular/core';
import { KarticaComponent } from '../kartica/kartica.component';
import { NgFor } from '@angular/common'
import { ListaNovosti } from '../data/ListaNovosti'

@Component({
  selector: 'app-products',
  standalone: true,
  imports: [KarticaComponent,NgFor,],
  templateUrl: './products.component.html',
  styleUrl: './products.component.css'
})
export class ProductsComponent {
  listaNovosti = ListaNovosti;
}
