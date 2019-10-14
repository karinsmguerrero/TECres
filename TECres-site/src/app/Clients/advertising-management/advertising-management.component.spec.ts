import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdvertisingManagementComponent } from './advertising-management.component';

describe('AdvertisingManagementComponent', () => {
  let component: AdvertisingManagementComponent;
  let fixture: ComponentFixture<AdvertisingManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdvertisingManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdvertisingManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
