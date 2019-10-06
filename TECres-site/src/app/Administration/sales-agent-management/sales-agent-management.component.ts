import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { SalesAgent } from 'src/app/models/sales-agent.model';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-sales-agent-management',
  templateUrl: './sales-agent-management.component.html',
  styleUrls: ['./sales-agent-management.component.css']
})
export class SalesAgentManagementComponent implements OnInit {

  constructor(private userservice : UserService, private toastr: ToastrService) { }

  agentList : SalesAgent[];
  amy : SalesAgent =
  {
    Name: 'Amy',
    EntryDate: '5/10/19',
    Id: 1,
    LastNames: 'Moore',
    UserName : 'Amoore',
    Password: '1234'
  }
  blessy : SalesAgent =
  {
    Name: 'Blessy',
    EntryDate: '5/10/19',
    Id: 2,
    LastNames: 'Moore',
    UserName : 'Bmoore',
    Password: '1234'
  }
  editing : boolean = false;
  editRowId : any = '';

  ngOnInit() {
    this.agentList = [this.amy, this.blessy];
  }

  edit(val){
    this.editRowId = val;
  }

  update(data : SalesAgent){
    this.toastr.success('Hello world!', 'Toastr fun!');
  }

  delete(data : SalesAgent){
    this.toastr.success('Hello world!', 'Toastr fun!');
  }
}
