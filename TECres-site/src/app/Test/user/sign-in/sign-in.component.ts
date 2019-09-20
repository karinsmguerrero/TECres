import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  constructor(private service : UserService) { }

  ngOnInit() {
  }

  onSubmit(username, password){
    this.service.userAuthentication(username, password).subscribe((data: any) => {
      
    },
    (err : HttpErrorResponse) => {

    })
  }

}
