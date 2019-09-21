import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.css']
})
export class WelcomeComponent implements OnInit {

  userClaims : any;

  constructor( private userService : UserService, private router : Router) { }

  ngOnInit() {
    this.userService.getUserClaims().subscribe((data : any) => {
      this.userClaims = data;
    });
  }
}
