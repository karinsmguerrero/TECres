import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GridPropertyComponent } from './grid-property.component';

describe('GridPropertyComponent', () => {
  let component: GridPropertyComponent;
  let fixture: ComponentFixture<GridPropertyComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GridPropertyComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GridPropertyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
