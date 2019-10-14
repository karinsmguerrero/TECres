import { Injectable } from '@angular/core';
import { Floor } from '../models/floor.model';
import {  HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class FloorManagementService {

  readonly rootURL = "http://localhost:44348/api";
  floorList : Floor[];

  constructor(private http : HttpClient) { }

  getFloors(){
    this.http.get(this.rootURL + '/GetPisos').toPromise().then(res => this.floorList = res as Floor[]);
  }

}
