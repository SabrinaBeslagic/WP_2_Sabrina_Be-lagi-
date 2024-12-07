import { Component } from '@angular/core';
import { RouterLink } from '@angular/router'; // Importujte RouterLink

@Component({
  selector: 'app-nav-bar',
  standalone: true,
  imports: [RouterLink], // Dodajte RouterLink ovdje
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css'] // Ispravno je 'styleUrls' umesto 'styleUrl'
})
export class NavBarComponent {}
