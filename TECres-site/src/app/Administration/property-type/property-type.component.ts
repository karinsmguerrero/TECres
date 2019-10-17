import { Component, OnInit } from '@angular/core';
import { EstateManagementService } from 'src/app/services/estate-management.service';
import { Estate } from 'src/app/models/estate.model';
import { LocationManagementService } from 'src/app/services/location-management.service';
import { from } from 'rxjs';
import { FloorManagementService } from 'src/app/services/floor-management.service';

@Component({
  selector: 'app-property-type',
  templateUrl: './property-type.component.html',
  styleUrls: ['./property-type.component.css']
})
export class PropertyTypeComponent implements OnInit {

  Provincia : string;
  Canton : string;
  Distrito : string;

  constructor(private service: EstateManagementService, private serviceLocation : LocationManagementService, private serviceFloor: FloorManagementService) { }

  ngOnInit() {
    
  }

 
}
