import { TestBed } from '@angular/core/testing';

import { NationalityManagementService } from './nationality-management.service';

describe('NationalityManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: NationalityManagementService = TestBed.get(NationalityManagementService);
    expect(service).toBeTruthy();
  });
});
