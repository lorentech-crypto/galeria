import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
//import { GalleryComponent } from './gallery/gallery.component';
//import { PhotoComponent } from './photo/photo.component';
//import { CommonModule } from '@angular/common';

@NgModule({
  imports: [BrowserModule], // ← sin duplicar imports
  declarations: [], // ← vacío
  bootstrap: [AppComponent]
})
export class AppModule { }
