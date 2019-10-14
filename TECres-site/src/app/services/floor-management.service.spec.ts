import { TestBed } from '@angular/core/testing';

import { FloorManagementService } from './floor-management.service';

describe('FloorManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FloorManagementService = TestBed.get(FloorManagementService);
    expect(service).toBeTruthy();
  });
});
