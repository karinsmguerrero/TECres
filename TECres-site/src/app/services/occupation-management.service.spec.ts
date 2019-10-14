import { TestBed } from '@angular/core/testing';

import { OccupationManagementService } from './occupation-management.service';

describe('OccupationManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OccupationManagementService = TestBed.get(OccupationManagementService);
    expect(service).toBeTruthy();
  });
});
