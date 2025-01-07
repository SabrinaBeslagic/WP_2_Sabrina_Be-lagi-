import { Component } from '@angular/core';
import { RouterOutlet, RouterModule} from '@angular/router';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { FooterComponent } from './footer/footer.component';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { KarticaComponent } from './kartica/kartica.component';
import { HeaderComponent } from './header/header.component';
import { AdmindashComponent } from './admindash/admindash.component';
import { HttpClientModule } from '@angular/common/http';
import { CalendarComponent } from './calendar/calendar.component';
import { DateTime } from 'luxon';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,RouterModule,NavBarComponent, FooterComponent, HomeComponent, AboutComponent,KarticaComponent, HeaderComponent, AdmindashComponent, CalendarComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
 meetings = {
     '2025-01-13': ['Assassins Creed Shadows', 'Developed by Ubisoft Quebec and published by Ubisoft.'],
     '2025-01-25': ['GTA 6', 'Developed by Rockstar Games'],
     '2025-03-02': ['FIFA 2025', 'Developed by EA Sports'],
   };
}
