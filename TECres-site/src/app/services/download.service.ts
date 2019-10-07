import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class DownloadService {

  constructor(private http: HttpClient) { }
  readonly rootURL = "http://localhost:65422";

  getPdf() {
    alert("pdf");
    return this.http.get(this.rootURL + '/api/getfile2');
  }
}
