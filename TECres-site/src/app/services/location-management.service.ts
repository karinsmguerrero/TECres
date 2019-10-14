import { Injectable } from '@angular/core';
import {  HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class LocationManagementService {

  readonly rootURL = "https://localhost:44348/api";
  provinciaList : string[];
  cantonList : string[];
  distritoList : string[];
  constructor(private http : HttpClient) { }

  getProvincia(){
    this.http.get(this.rootURL + '/GetProvincia').toPromise().then(res => this.provinciaList = res as string[]);
  }
  getCanton(provincia:string){
    this.http.get(this.rootURL + '/GetCanton/?Provincia='+provincia).toPromise().then(res => this.cantonList = res as string[]);
  }
  getCa(provincia:string){
    console.log(this.http.get(this.rootURL + '/GetCanton/?Provincia='+provincia).toPromise());
    return this.http.get(this.rootURL + '/GetCanton/?Provincia='+provincia).toPromise();
  }
  getDistrito(provincia:string, canton:string){
    this.http.get(this.rootURL + '/GetCanton/?Provincia='+provincia+'&Canton='+canton).toPromise().then(res => this.distritoList = res as string[]);
  }
}
