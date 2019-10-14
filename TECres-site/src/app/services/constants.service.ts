import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ConstantsService {
  readonly routeURL = "http://localhost:53618/api"
  constructor() { }
}
