import { Injectable } from '@angular/core';
import { Nationality } from '../models/nationality.model';
import {  HttpClient } from "@angular/common/http";
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class NationalityManagementService {
  nationalityList : Nationality[];

  constructor(private http : HttpClient, private constant: ConstantsService) { }

  getNationalities(){
    this.http.get(this.constant.routeURL + '/GetNacionalidades').toPromise().then(res => this.nationalityList = res as Nationality[]);
  }

}
