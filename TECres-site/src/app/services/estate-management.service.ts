import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Estate } from '../models/estate.model';
import { ConstantsService } from '../services/constants.service';

@Injectable({
  providedIn: 'root'
})
export class EstateManagementService {

  
  estatelist: Estate[];

  constructor(private http:HttpClient,private constant: ConstantsService) {}

  getEstate() {
    this.http.get(this.constant.routeURL + '/GetInmuebles').toPromise().then(res => this.estatelist = res as Estate[]);
  }

}
