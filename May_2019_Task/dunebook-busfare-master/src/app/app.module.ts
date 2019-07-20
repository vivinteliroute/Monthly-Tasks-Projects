import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import {HttpClientModule} from '@angular/common/http';

import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MdButtonModule, MdCardModule, MdDatepickerModule, MdInputModule, MdNativeDateModule, MdRadioModule,
   MdToolbarModule } from '@angular/material';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { SearchCardComponent } from './search-card.component';
import { SearchResultComponent } from './search-result.component';

@NgModule({
  declarations: [
    AppComponent,
    SearchCardComponent,
    SearchResultComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    HttpClientModule,
    MdButtonModule,
    MdCardModule,
    MdDatepickerModule,
    MdInputModule,
    MdNativeDateModule,
    MdRadioModule,
    MdToolbarModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
