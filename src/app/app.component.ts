import { Component } from '@angular/core';
import { GalleryComponent } from './gallery/gallery.component'; // ✅ importa el standalone

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [GalleryComponent],
  template: `<app-gallery></app-gallery>`,

})
export class AppComponent {}
