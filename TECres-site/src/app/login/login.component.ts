import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  isLogingError : boolean = false;

  constructor(private service : UserService, private router : Router) { }

  ngOnInit() {
  }

  onSubmit(username, password){
    this.service.userAuthentication(username, password).subscribe((data: any) => {
      localStorage.setItem('userToken', data.access_token);
      localStorage.setItem('userRole', data.role);
      this.router.navigate(['/home']);
    },
    (err : HttpErrorResponse) => {
      this.isLogingError = true;
    })
  }

}
