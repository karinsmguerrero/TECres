import { Injectable } from '@angular/core';
import { Profile } from '../models/profile.model';
import {  HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class ProfileManagementService {

  
  readonly rootURL = "http://localhost:44348/api";
  profileList : Profile[];

  constructor(private http : HttpClient) { }

  getProfiles(){
    this.http.get(this.rootURL + '/GetPerfiles').toPromise().then(res => this.profileList = res as Profile[]);
  }

}
