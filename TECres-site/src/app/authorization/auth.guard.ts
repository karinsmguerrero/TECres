import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { UserService } from '../services/user.service';


     /*
  Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
  Objetivo: Verificar si el usuario está autenticado para seguir a la ruta
  Parámetros: ninguno
  */
@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private router : Router,private userService : UserService){}
  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot):  boolean {
      if (localStorage.getItem('userToken') != null)
      {
        let roles = next.data["roles"] as Array<string>;
        if (roles) {
          var match = this.userService.roleMatch(roles);
          if (match) return true;
          else {
            this.router.navigate(['/forbidden']);
            return false;
          }
        }
        else
          return true;
      }
     //
      this.router.navigate(['/signin']);
      return false;
  }
}
