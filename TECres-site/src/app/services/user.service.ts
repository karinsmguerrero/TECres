import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { User } from '../models/user.model';
import { Client } from '../models/client.model';
import { Customer } from '../models/customer.model';
import { SalesAgent } from '../models/sales-agent.model';
import { Admin } from '../models/admin.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  readonly rootURL = "http://localhost:53618";
  constructor(private http: HttpClient) { }

  /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: registrar usuarios nuevos
  Parámetros: user : User => objeto de tipo User que contiene los datos del usuario
  */
  registerUser(user: User, roles: number) {
    const body = {
      UserName: user.UserName,
      Password: user.Password,
      Email: user.Email,
      FirstName: user.FirstName,
      LastName: user.LastName,
      Roles: roles
    }
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.post(this.rootURL + '/api/User/Register', body, { headers: reqHeader });
  }

  registerAdmin(user: Admin, roles: number) {
    const body = {
      Name: user.Name,
      LastNames: user.LastNames,
      Id: user.Id,
      EntryDate: user.EntryDate,
      BirthDate: user.BirthDate,
      UserName : user.UserName,
      Password : user.Password,
      Roles: roles
    }
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.post(this.rootURL + '/api/User/Register', body, { headers: reqHeader });
  }

  registerClient(user: Client, roles: number) {
    const body = {
      Id: user.Id,
      Name: user.Name,
      LastNames: user.LastNames,
      Nationality: user.Nationality,
      Email: user.Email,
      Ocupation: user.Ocupation,
      UserName : user.UserName,
      Password : user.Password,
      Roles: roles
    }
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.post(this.rootURL + '/api/User/Register', body, { headers: reqHeader });
  }

  registerCustomer(user: Customer, roles: number) {
    const body = {
      Name: user.Name,
      LastName: user.LastName,
      BirthDate: user.BirthDate,
      Adress: user.Adress,
      Income: user.Income,
      Ocupation: user.Ocupation,
      UserName : user.UserName,
      Password : user.Password,
      Roles: roles
    }
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.post(this.rootURL + '/api/User/Register', body, { headers: reqHeader });
  }

  registerAgent(user: SalesAgent, roles: number) {
    const body = {
      Id: user.Id,
      Name: user.Name,                                                                                        
      LastNames: user.LastNames,
      EntryDate: user.EntryDate,
      UserName : user.UserName,
      Password : user.Password
    }
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.post(this.rootURL + '/api/User/Register', body, { headers: reqHeader });
  }

  /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: autenticar un usuario mediante tokens en el API
  Parámetros: username => objeto de tipo string que contiene el nombre de usuario
              Password => objeto de tipo string que contiene la contraseña
  */
  userAuthentication(username, password) {
    var data = "username=" + username + "&password=" + password +
      "&grant_type=password";
    var reqHeader = new HttpHeaders({ 'Content-Type': 'application/x-www-urlencoded', 'No-Auth': 'True' });
    return this.http.post(this.rootURL + '/token', data, { headers: reqHeader });
  }

  /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: obtener los datos del usuario logeado desde el API
  Parámetros: ninguno
  */
  getUserClaims() {
    return this.http.get(this.rootURL + '/api/GetUserClaims');
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

  getAgents() {
    return this.http.get(this.rootURL + '/api/Agents/GetAllAgents');
  }

  updateAgent(agent : SalesAgent){
    const body = {
      Id: agent.Id,
      Name: agent.Name,
      LastNames: agent.LastNames,
      EntryDate: agent.EntryDate,
      UserName : agent.UserName
    }
    var reqHeader = new HttpHeaders({ 'No-Auth': 'True' });
    return this.http.put(this.rootURL + '/api/Agents/Update', body, { headers: reqHeader });
  }

}
