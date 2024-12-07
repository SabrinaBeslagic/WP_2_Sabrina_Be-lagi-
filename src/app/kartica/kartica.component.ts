import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-kartica',
  standalone: true,
  imports: [],
  templateUrl: './kartica.component.html',
  styleUrls: ['./kartica.component.css']
})
export class KarticaComponent {
  @Input() naslovNovosti: string = '';
  @Input() urlNovosti: string = '';
  @Input() textNovosti: string = '';
  @Input() brojNovosti: number = 0;
}
