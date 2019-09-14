import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalesAgentManagementComponent } from './sales-agent-management.component';

describe('SalesAgentManagementComponent', () => {
  let component: SalesAgentManagementComponent;
  let fixture: ComponentFixture<SalesAgentManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalesAgentManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalesAgentManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
