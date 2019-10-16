import { TestBed } from '@angular/core/testing';

import { FotosManagementService } from './fotos-management.service';

describe('FotosManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FotosManagementService = TestBed.get(FotosManagementService);
    expect(service).toBeTruthy();
  });
});
