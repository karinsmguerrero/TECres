import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  readonly rootURL = "http://localhost:65422";
  constructor(private http: HttpClient) { }

  /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: registrar usuarios nuevos
  Parámetros: user : User => objeto de tipo User que contiene los datos del usuario
  */
  registerUser(user: User, roles : string[]) {
    const body = {
      UserName: user.UserName,
      Password: user.Password,
      Email: user.Email,
      FirstName: user.FirstName,
      LastName: user.LastName,
      Roles : roles
    }
    var reqHeader = new HttpHeaders({'No-Auth':'True'});
    return this.http.post(this.rootURL + '/api/User/Register', body, {headers : reqHeader});
  }

  /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: autenticar un usuario mediante tokens en el API
  Parámetros: username => objeto de tipo string que contiene el nombre de usuario
              Password => objeto de tipo string que contiene la contraseña
  */
  userAuthentication(username, password){
    var data = "username=" + username + "&password=" + password +
    "&grant_type=password";
    var reqHeader = new HttpHeaders({ 'Content-Type': 'application/x-www-urlencoded','No-Auth':'True' });
    return this.http.post(this.rootURL + '/token', data, { headers: reqHeader });
  }

  /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: obtener los datos del usuario logeado desde el API
  Parámetros: ninguno
  */
  getUserClaims(){
    return this.http.get(this.rootURL+ '/api/GetUserClaims');
  }

  /*
  Código tomado de: https://www.youtube.com/watch?v=Ks5ADKqPrBQ
  Objetivo: obtener los roles desde la base de datos
  Parámetros: ninguno
  */
  getAllRoles() {
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.get(this.rootURL + '/api/GetAllRoles', { headers: reqHeader });
  }

  roleMatch(allowedRoles): boolean {
    var isMatch = false;
    var userRoles: string[] = JSON.parse(localStorage.getItem('userRole'));
    allowedRoles.forEach(element => {
      if (userRoles.indexOf(element) > -1) {
        isMatch = true;
        return false;
      }
    });
    return isMatch;

  }

}
