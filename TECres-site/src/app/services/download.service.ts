import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DownloadService {

  constructor(private http: HttpClient, private toastr: ToastrService) { }
  readonly rootURL = "http://localhost:65422";
  
  public pdfData: any;

  getPdf() {
    this.http.get(this.rootURL + '/api/getAdvertisementReport',{ responseType: 'arraybuffer' })
      .subscribe( file => {
       // this.pdfData = new Uint8Array(file);
       this.pdfData = file;
      });
    return this.pdfData;
  }

  getPDF2(): string {
    return '/assets/proyecto.pdf';
  }

  createPDF(){

  }
  //codigo obtenido de: http://jslim.net/blog/2018/03/13/Angular-4-download-file-from-server-via-http/
  downloadFile() {
    this.http.get(this.rootURL + '/api/getAdvertisementReport', { responseType: 'arraybuffer' })
      .subscribe(res => {
        var url = window.URL.createObjectURL(new Blob([res]));
        var a = document.createElement('a');
        document.body.appendChild(a);
        a.setAttribute('style', 'display: none');
        a.href = url;
        a.download = 'res.pdf';
        a.click();
        window.URL.revokeObjectURL(url);
        a.remove(); // remove the element
      }, error => {
        this.toastr.error('Error!', 'No se ha podido descargar el archivo');
      }, () => {
        console.log('Completed file download.')
      });
  }
}
