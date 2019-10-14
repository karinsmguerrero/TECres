import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Estate } from '../models/estate.model';

@Injectable({
  providedIn: 'root'
})
export class PropertyManagementService {

  readonly routeURL = "https://localhost:44348/api"
  estatelist: Estate[];

  constructor(private http:HttpClient) {}

  getEstate() {
    this.http.get(this.routeURL + "/GetInmuebles").toPromise().then(res => this.estatelist = res as Estate[]);
  }

}
