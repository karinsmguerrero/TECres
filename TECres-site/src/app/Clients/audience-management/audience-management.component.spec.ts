import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AudienceManagementComponent } from './audience-management.component';

describe('AudienceManagementComponent', () => {
  let component: AudienceManagementComponent;
  let fixture: ComponentFixture<AudienceManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AudienceManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AudienceManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
