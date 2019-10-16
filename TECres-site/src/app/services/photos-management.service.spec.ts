import { TestBed } from '@angular/core/testing';

import { PhotosManagementService } from './photos-management.service';

describe('PhotosManagementService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PhotosManagementService = TestBed.get(PhotosManagementService);
    expect(service).toBeTruthy();
  });
});
