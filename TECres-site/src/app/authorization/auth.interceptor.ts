import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from "@angular/common/http";
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

    constructor(private router: Router) { }

    /*
 Código tomado de: https://www.youtube.com/watch?v=e8BlURn6SFk&t=135s
 Objetivo: interceptar todas las peticiones Http para verificar si está autenticada 
 o redirigir al inicio de sesión
 Parámetros: req : HttpRequest<any> => contiene peticiones Http (get, post, put, ...)
 */
    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        if (req.headers.get('No-Auth') == "True")
            return next.handle(req.clone());

        if (localStorage.getItem('userToken') != null) {
            const clonedreq = req.clone({
                headers: req.headers.set("Authorization", "Bearer " + localStorage.getItem('userToken'))
            });
            return next.handle(clonedreq).pipe(
                tap(
                    succ => { },
                    err => {
                        if (err.status === 401)
                            this.router.navigateByUrl('/signin');
                        else (err.status === 401)
                        this.router.navigateByUrl('/forbidden');
                    }
                ));
        }
        else {
            this.router.navigateByUrl('/signin');
        }
    }
}