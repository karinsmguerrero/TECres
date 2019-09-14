import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RealStateManagementComponent } from './real-state-management.component';

describe('RealStateManagementComponent', () => {
  let component: RealStateManagementComponent;
  let fixture: ComponentFixture<RealStateManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RealStateManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RealStateManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
