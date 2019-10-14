import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  constructor(private router: Router, private userService: UserService) { }

  ngOnInit() {
  }

  Logout() {
    localStorage.removeItem('userToken');
    this.router.navigate(['/signin']);
  }

  loggedIn() {
    if (localStorage.getItem('userToken') != null)
      return true;
  }
}
