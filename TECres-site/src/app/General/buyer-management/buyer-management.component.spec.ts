import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BuyerManagementComponent } from './buyer-management.component';

describe('BuyerManagementComponent', () => {
  let component: BuyerManagementComponent;
  let fixture: ComponentFixture<BuyerManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BuyerManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BuyerManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
