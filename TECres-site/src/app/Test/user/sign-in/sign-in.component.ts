import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  isLogingError : boolean = false;

  constructor(private service : UserService, private router : Router) { }

  ngOnInit() {
  }

  onSubmit(username, password){
    this.service.userAuthentication(username, password).subscribe((data: any) => {
      localStorage.setItem('userToken', data.access_token)
      this.router.navigate(['/home']);
    },
    (err : HttpErrorResponse) => {
      this.isLogingError = true;
    })
  }

}
