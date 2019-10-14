import { Injectable } from '@angular/core';
import { Floor } from '../models/floor.model';
import {  HttpClient } from "@angular/common/http";
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class FloorManagementService {
  
  floorList : Floor[];

  constructor(private http : HttpClient, private constant: ConstantsService) { }

  getFloors(){
    this.http.get(this.constant.routeURL + '/GetPisos').toPromise().then(res => this.floorList = res as Floor[]);
  }

}
