import { Component, OnInit } from '@angular/core';
import { EstateManagementService } from '../../services/estate-management.service';

@Component({
  selector: 'app-estate',
  templateUrl: './estate.component.html',
  styleUrls: ['./estate.component.css']
})
export class EstateComponent implements OnInit {

  constructor(private serviceEstate: EstateManagementService) { }

  ngOnInit() {
    this.serviceEstate.getEstate();
  }

}
