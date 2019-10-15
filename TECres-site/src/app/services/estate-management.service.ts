import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Estate } from '../models/estate.model';
import { ConstantsService } from '../services/constants.service';
import { NgForm } from '@angular/forms';
import { HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class EstateManagementService {

  
  //formData: EstateAux;
  estatelist: Estate[];

  constructor(private http:HttpClient,private constant: ConstantsService) {}

  get() {
    this.http.get(this.constant.routeURL + '/GetInmuebles').toPromise().then(res => this.estatelist = res as Estate[]);
  }

  insert(formData:NgForm){
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    var body ={
      TipoPropiedad:formData.value.TipoPropiedad
    }
    this.http.post(this.constant.routeURL + '/PostInmueble',body,httpOptions).toPromise();
    
  }

  update(estate:Estate, formData:NgForm){
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    var body ={
      Id: estate.Id,
      //Id:8,
      NewValue: formData.value.TipoPropiedad
    };
    this.http.put(this.constant.routeURL + '/PutInmueble',body,httpOptions).toPromise();
  }

  delete(id:number){
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    this.http.delete(this.constant.routeURL + '/DeleteInmueble?Id='+id,httpOptions).toPromise();
  }

}
