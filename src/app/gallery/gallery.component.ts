import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PhotoComponent } from '../photo/photo.component';
import { Photo } from '../photo/photo.model'; 

@Component({
  selector: 'app-gallery',
  standalone: true,
  imports: [CommonModule, PhotoComponent],
  templateUrl: './gallery.component.html',
  styleUrls: ['./gallery.component.css']
})
export class GalleryComponent {
  selected: Photo | null = null;
  photos: Photo[] = [];

  open(photo: Photo) {
    this.selected = photo;
  }

  close() {
    this.selected = null;
  }
}

