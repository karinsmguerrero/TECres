import { Component, OnInit } from '@angular/core';
import { EstateManagementService } from '../../services/estate-management.service';
import { NgForm } from '@angular/forms';
import { Estate } from '../../models/estate.model';

@Component({
  selector: 'app-estate',
  templateUrl: './estate.component.html',
  styleUrls: ['./estate.component.css']
})
export class EstateComponent implements OnInit {

  estate: Estate;

  constructor(private serviceEstate: EstateManagementService) { }

  ngOnInit() {
    this.serviceEstate.get();
  
  }

 
}
