import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import 'rxjs/add/operator/map';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
readonly rootURL = "http://localhost:65422";
  constructor(private http : HttpClient) { }

  registerUser(user : User){
    const body: User = {
      UserName: user.UserName,
      Password: user.Password,
      Email: user.Email,
      FirstName: user.FirstName,
      LastName: user.LastName
    }

    return this.http.post(this.rootURL + '/api/User/Register', body);
  }
}
