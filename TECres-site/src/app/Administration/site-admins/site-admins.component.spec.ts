import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SiteAdminsComponent } from './site-admins.component';

describe('SiteAdminsComponent', () => {
  let component: SiteAdminsComponent;
  let fixture: ComponentFixture<SiteAdminsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SiteAdminsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SiteAdminsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
