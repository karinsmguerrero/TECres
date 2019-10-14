import { Injectable } from '@angular/core';
import { Occupation } from '../models/occupation.model';
import {  HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class OccupationManagementService {

  readonly rootURL = "http://localhost:44348/api";
  occupationList : Occupation[];

  constructor(private http : HttpClient) { }

  getOcupaciones(){
    this.http.get(this.rootURL + '/GetOcupaciones').toPromise().then(res => this.occupationList = res as Occupation[]);
  }

}
