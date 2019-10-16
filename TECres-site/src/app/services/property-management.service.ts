import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ConstantsService } from './constants.service';
import { Property } from '../models/property.model';

@Injectable({
  providedIn: 'root'
})
export class PropertyManagementService {

  propertyList: Property[];

  constructor(private http:HttpClient,  private constant: ConstantsService) {}

  get() {
    this.http.get(this.constant.routeURL + "/GetPropiedades").toPromise().then(res => this.propertyList = res as Property[]);
  }

}
