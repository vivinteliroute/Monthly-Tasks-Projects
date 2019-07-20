import { Component, OnInit } from '@angular/core';
import {SearchService} from './search.service';
import { Subscription } from 'rxjs/Subscription';

@Component({
  selector: 'app-search-result',
  templateUrl: './search-result.component.html',
  styleUrls: ['./search-result.component.css']
})
export class SearchResultComponent implements OnInit {
  subscription: Subscription;
  results: object;

  constructor(private service: SearchService) {
    this.subscription = service.results$.subscribe(results => {
      this.results = results;
    })
  }

  ngOnInit() {

  }
}
