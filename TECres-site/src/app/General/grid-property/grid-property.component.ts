import { Component, OnInit } from '@angular/core';
import { PropertyManagementService } from '../../services/property-management.service';
import { Property } from '../../models/property.model';
import { PhotosManagementService } from '../../services/photos-management.service';

@Component({
  selector: 'app-grid-property',
  templateUrl: './grid-property.component.html',
  styleUrls: ['./grid-property.component.css']
})
export class GridPropertyComponent implements OnInit {
  property:Property;
  constructor(private serviceProperty: PropertyManagementService, 
    private servicePhotos:PhotosManagementService) { }

  ngOnInit() {
    this.serviceProperty.get();
  }

  selectProperty(property:Property){
    this.property=property;
  }
  getPhotos(id:number){
    this.servicePhotos.getPhotos(id);
  }
  
}
