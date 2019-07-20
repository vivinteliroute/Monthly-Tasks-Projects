import { TestBed, inject } from '@angular/core/testing';

import { SearchCardService } from './search-card.service';

describe('SearchCardService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [SearchCardService]
    });
  });

  it('should be created', inject([SearchCardService], (service: SearchCardService) => {
    expect(service).toBeTruthy();
  }));
});
