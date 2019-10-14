import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GhomeComponent } from './ghome.component';

describe('GhomeComponent', () => {
  let component: GhomeComponent;
  let fixture: ComponentFixture<GhomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GhomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GhomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
