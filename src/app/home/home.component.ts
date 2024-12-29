import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  standalone: true
})
export class HomeComponent {

  onButtonClick() {
    alert('Vi ste kliknuli na gumb!');
    const homeContainer = document.querySelector('.home-container') as HTMLElement;
    if (homeContainer) {
      homeContainer.style.backgroundColor = '#f2f2f2';

    }
  }
}

