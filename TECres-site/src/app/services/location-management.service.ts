import { Injectable } from '@angular/core';
import {  HttpClient } from "@angular/common/http";
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class LocationManagementService {

  provinciaList : string[];
  cantonList : string[];
  distritoList : string[];
  constructor(private http : HttpClient, private constant: ConstantsService) { }

  getProvincia(){
    this.http.get(this.constant.routeURL + '/GetProvincia').toPromise().then(res => this.provinciaList = res as string[]);
  }
  getCanton(provincia:string){
    this.http.get(this.constant.routeURL + '/GetCanton/?Provincia='+provincia).toPromise().then(res => this.cantonList = res as string[]);
  }
  getCa(provincia:string){
    console.log(this.http.get(this.constant.routeURL + '/GetCanton/?Provincia='+provincia).toPromise());
    return this.http.get(this.constant.routeURL + '/GetCanton/?Provincia='+provincia).toPromise();
  }
  getDistrito(provincia:string, canton:string){
    this.http.get(this.constant.routeURL + '/GetCanton/?Provincia='+provincia+'&Canton='+canton).toPromise().then(res => this.distritoList = res as string[]);
  }
}
