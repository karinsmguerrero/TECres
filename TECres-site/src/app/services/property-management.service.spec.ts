import { TestBed } from '@angular/core/testing';

import { PropertyManagementService } from './property-management.service';

describe('PropertyManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PropertyManagementService = TestBed.get(PropertyManagementService);
    expect(service).toBeTruthy();
  });
});
