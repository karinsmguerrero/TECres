import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';
import { Client } from 'src/app/models/client.model';


@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  registeredClient : Client;
 
  user: User;
  roles : any[];
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";

  showSeller : Boolean = false;
  showSalesAgent : Boolean = false;
  showCustomer : Boolean = false;

  constructor(private service: UserService) { }

  ngOnInit() {
    this.resetForm();
    this.service.getAllRoles().subscribe(
      (data : any)=>{
        data.forEach(obj => obj.selected = false);
        this.roles = data;
      }
    );
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.user = {
      UserName: '',
      Password: '',
      Email: '',
      FirstName: '',
      LastName: ''
    }

    if (this.roles)
    this.roles.map(x => x.selected = false);
  }

  onSubmit(form: NgForm) {
    var x = this.roles.filter(x => x.selected).map(y => y.Name);
    this.service.registerUser(form.value,x)
      .subscribe((data: any) => {
        if (data.Succeeded == true) {
          this.resetForm(form);
        }
          
      });
  }

  updateSelectedRoles(index) {
    this.roles[index].selected = !this.roles[index].selected;
  }

  showSellerForm(){
    this.showSeller = true;
    this.showSalesAgent = false;
    this.showCustomer = false;
  }

  showSalesAgentForm(){
    this.showSeller = false;
    this.showSalesAgent = true;
    this.showCustomer = false;
  }

  showCustomerForm(){
    this.showSeller = false;
    this.showSalesAgent = false;
    this.showCustomer = true;
  }

}