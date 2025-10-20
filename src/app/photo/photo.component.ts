import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Photo } from './photo.model'; 

@Component({
  selector: 'app-photo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './photo.component.html',
  styleUrls: ['./photo.component.css']
})
export class PhotoComponent {
  @Input() photo!: Photo;
  @Output() clickPhoto = new EventEmitter<Photo>();

  onClick() {
    this.clickPhoto.emit(this.photo);
  }
}
