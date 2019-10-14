import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-site-admins',
  templateUrl: './site-admins.component.html',
  styleUrls: ['./site-admins.component.css']
})
export class SiteAdminsComponent implements OnInit {

  agents: string[] = ["a", "b", "c", "d", "e", "f", "g", "h"];
  user = {
    name: 'awesome user'
  };  

  ngOnInit() {
  }
  
}
