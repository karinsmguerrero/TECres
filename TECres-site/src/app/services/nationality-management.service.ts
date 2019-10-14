import { Injectable } from '@angular/core';
import { Nationality } from '../models/nationality.model';
import {  HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class NationalityManagementService {

  readonly rootURL = "http://localhost:44348/api";
  nationalityList : Nationality[];

  constructor(private http : HttpClient) { }

  getNationalities(){
    this.http.get(this.rootURL + '/GetNacionalidades').toPromise().then(res => this.nationalityList = res as Nationality[]);
  }

}
