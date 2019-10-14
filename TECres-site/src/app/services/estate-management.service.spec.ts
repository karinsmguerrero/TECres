import { TestBed } from '@angular/core/testing';

import { EstateManagementService } from './estate-management.service';

describe('EstateManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: EstateManagementService = TestBed.get(EstateManagementService);
    expect(service).toBeTruthy();
  });
});
