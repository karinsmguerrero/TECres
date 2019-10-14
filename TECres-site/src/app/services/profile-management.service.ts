import { Injectable } from '@angular/core';
import { Profile } from '../models/profile.model';
import {  HttpClient } from "@angular/common/http";
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class ProfileManagementService {

  profileList : Profile[];

  constructor(private http : HttpClient,  private constant: ConstantsService) { }

  getProfiles(){
    this.http.get(this.constant.routeURL + '/GetPerfiles').toPromise().then(res => this.profileList = res as Profile[]);
  }

}
