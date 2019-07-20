import { Injectable } from '@angular/core';
import { Subject } from 'rxjs/Subject';
import { HttpClient } from '@angular/common/http';

import { SearchCardInterface } from './search-card.interface';

@Injectable()
export class SearchService {

  // Observable source
  private resultsSource = new Subject<any>();

  // Observable stream
  results$ = this.resultsSource.asObservable();

  constructor(private http: HttpClient) { }

  getSearchResults(model: SearchCardInterface) {
    const baseUrl = 'http://developer.goibibo.com';
    const endpoint = '/api/bus/search/';
    const params = {
      app_id: '2db00098',
      app_key: 'ad8f03752322e5f4afce7ffd674561e6',
      format: 'json',
      source: model.origin,
      destination: model.destination,
      dateofdeparture: this.formatDate(model.departureDate),
      dateofarrival: this.formatDate(model.arrivalDate)
    }
    const url = `${baseUrl}${endpoint}?${this.objToUrlParams(params)}`;
    this.http.get(url).subscribe(data => {
      this.resultsSource.next(data['data']);
    });
  }

  // This is an util method to return YYYYMMDD date string
  formatDate(date: Date): string {
    const mm = date.getMonth() + 1; // getMonth is zero indexed
    const dd = date.getDate();
    return `${date.getFullYear()}${ mm > 9 ? mm : '0' + mm}${dd > 9 ? dd : '0' + dd}`;
  }

  // This is a method to convert a dictionary to url param string
  objToUrlParams(params): string {
    let toret = '';
    for (const key in params) {
      if (params.hasOwnProperty(key)) {
        toret += `${key}=${encodeURIComponent(params[key])}&`;
      }
    }
    return toret;
  }

};

