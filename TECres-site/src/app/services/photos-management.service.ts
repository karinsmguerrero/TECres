import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class PhotosManagementService {

  photosList : string[];
  constructor(private http : HttpClient, private constant: ConstantsService) { }

  getPhotos(IdPropiedad:number){
    this.http.get(this.constant.routeURL + '/GetFotos/?IdPropiedad='+IdPropiedad).toPromise().then(res => this.photosList = res as string[]);
  }
  getPhoto(IdPropiedad:number){
    this.http.get(this.constant.routeURL + '/GetFotos/?IdPropiedad='+IdPropiedad).toPromise().then(res => this.photosList = res as string[]);
  }
}
