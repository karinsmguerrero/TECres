import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';
import { Client } from 'src/app/models/client.model';
import { Customer } from 'src/app/models/customer.model';
import { SalesAgent } from 'src/app/models/sales-agent.model';
import { Admin } from 'src/app/models/admin.model';



@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  client: Client;
  customer: Customer;
  agent: SalesAgent;
  admin: Admin;

  role: number = 0;
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";

  showSeller: Boolean = false;
  showSalesAgent: Boolean = false;
  showCustomer: Boolean = false;
  showAdmin: Boolean = false;

  constructor(private service: UserService) { }

  ngOnInit() {
    this.resetAgentForm();
    this.resetClientForm();
    this.resetCustomerForm();
    this.resetAdminForm();
  }

  resetForm() {
    if (this.showSeller) {
      this.resetClientForm();
    }
    else if (this.showCustomer) {
      this.resetCustomerForm();
    }
    else if (this.showSalesAgent) {
      this.resetAgentForm();
    } else if (this.showAdmin) {
      this.resetAdminForm();
    }
  }

  resetClientForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.client = {
      Name: '',
      Id: '',
      Email: '',
      Nationality: '',
      LastNames: '',
      Ocupation: '',
      UserName : '',
      Password: ''
    }
  }

  resetCustomerForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.customer = {
      Name: '',
      BirthDate: '',
      Income: '',
      Adress: '',
      LastName: '',
      Ocupation: '',
      UserName : '',
      Password: ''
    }
  }

  resetAgentForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.agent = {
      Name: '',
      EntryDate: '',
      Id: null,
      LastNames: '',
      UserName : '',
      Password: ''
    }
  }

  resetAdminForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.admin = {
      Name: '',
      EntryDate: '',
      Id: null,
      LastNames: '',
      BirthDate: '',
      UserName : '',
      Password: ''
    }
  }

  onSubmit(form: NgForm) {
    this.service.registerUser(form.value, this.role)
      .subscribe((data: any) => {
        if (data.Succeeded == true) {
          this.resetForm();
        }
      });
  }

  showSellerForm() {
    this.showSeller = true;
    this.showSalesAgent = false;
    this.showCustomer = false;
    this.showAdmin = false;
    this.role = 2;
  }

  showSalesAgentForm() {
    this.showSeller = false;
    this.showSalesAgent = true;
    this.showCustomer = false;
    this.showAdmin = false;
    this.role = 4;
  }

  showCustomerForm() {
    this.showSeller = false;
    this.showSalesAgent = false;
    this.showCustomer = true;
    this.showAdmin = false;
    this.role = 3;
  }

  showAdminForm() {
    this.showSeller = false;
    this.showSalesAgent = false;
    this.showCustomer = false;
    this.showAdmin = true;
    this.role = 1;
  }

}