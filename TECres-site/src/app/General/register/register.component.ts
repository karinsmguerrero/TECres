import { Component, OnInit } from '@angular/core';
import { ProfileManagementService } from 'src/app/services/profile-management.service';
import { NgForm } from '@angular/forms';
import { LocationManagementService } from 'src/app/services/location-management.service';
import { OccupationManagementService } from 'src/app/services/occupation-management.service';
import { NationalityManagementService } from 'src/app/services/nationality-management.service';


@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  profileName : string="";
  showClient: Boolean = false;
  showCustomer: Boolean = false;
  showAdmin: Boolean = false;
  Provincia : string;
  Canton : string;
  Distrito : string;
  OccupationId : number;
  constructor(private serviceProfile : ProfileManagementService, 
    private serviceLocation : LocationManagementService,
    private serviceOccupation: OccupationManagementService,
    private serviceNationality: NationalityManagementService) {
   }

   ngOnInit() {
    this.serviceProfile.getProfiles();
  }

  showClientForm(proName: string ) {
    this.serviceNationality.getNationalities();
    this.showClient = true;
    this.showCustomer = false;
    this.showAdmin = false;
    this.profileName = proName;
    console.log(this.profileName);
  }

  showCustomerForm() {
    this.serviceLocation.getProvincia();
    this.serviceOccupation.getOcupaciones();
    this.showClient = false;
    this.showCustomer = true;
    this.showAdmin = false;
    this.profileName ="";
  }

  showAdminForm() {
    this.showClient = false;
    this.showCustomer = false;
    this.showAdmin = true;
    this.profileName ="";
  }

  onSubmit(form: NgForm) {
    
  }

  addCostumer(){
  
  }

  loadCantones(provincia : string){
    this.Provincia = provincia
    console.log(this.Provincia)
    this.serviceLocation.getCanton(provincia);
    
  }
  loadDistritos(canton : string){
    this.Canton= canton;
    console.log(canton)
    this.serviceLocation.getDistrito(this.Provincia,this.Canton);
    
  }

  selectDistrito(distrito: string){
    this.Distrito=distrito;
  }

  selectOccupation(occupation: number){
    this.OccupationId=occupation;
  }

}
