import { Injectable } from '@angular/core';
import { Occupation } from '../models/occupation.model';
import {  HttpClient } from "@angular/common/http";
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class OccupationManagementService {

  occupationList : Occupation[];

  constructor(private http : HttpClient,  private constant: ConstantsService) { }

  getOcupaciones(){
    this.http.get(this.constant.routeURL + '/GetOcupaciones').toPromise().then(res => this.occupationList = res as Occupation[]);
  }

}
