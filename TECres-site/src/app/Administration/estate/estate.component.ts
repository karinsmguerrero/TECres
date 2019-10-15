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

  onSubmit(form :NgForm){
    this.serviceEstate.insert(form);
  }
  onUpdate(form :NgForm){
    console.log("Updated");
    this.serviceEstate.update(this.estate,form);
  }
  selectEstate(estate:Estate){
    this.estate=estate;
    console.log(this.estate.TipoPropiedad)
  }
  getSelectEstate(){
    return this.estate.TipoPropiedad;
  }
  onDelete(id:number){
    console.log("Deleted");
    this.serviceEstate.delete(id);
  }
}
