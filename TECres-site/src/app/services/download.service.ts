import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { ConstantsService } from './constants.service';

@Injectable({
  providedIn: 'root'
})
export class DownloadService {

  constructor(private http: HttpClient, private toastr: ToastrService, private consts : ConstantsService) { }
  readonly rootURL = this.consts.routeURL;

  getAdvertisementReport() {
    this.http.get(this.rootURL + '/getAdvertisementReport', { responseType: 'arraybuffer' })
  }

  getCommissionReport() {
    this.http.get(this.rootURL + '/getCommissionReport', { responseType: 'arraybuffer' });
  }

  getSalesReport(startDate: string, endDate: string) {
    const body = {
      StartDate: startDate,
      EndDate: endDate
    }
    this.http.post(this.rootURL + '/getSalesReport', body, { responseType: 'arraybuffer' });
  }

  //codigo obtenido de: http://jslim.net/blog/2018/03/13/Angular-4-download-file-from-server-via-http/
  downloadAdvertisementReport() {
    this.http.get(this.rootURL + '/getAdvertisementReport', { responseType: 'arraybuffer' })
      .subscribe(res => {
        var url = window.URL.createObjectURL(new Blob([res]));
        var a = document.createElement('a');
        document.body.appendChild(a);
        a.setAttribute('style', 'display: none');
        a.href = url;
        a.download = 'AdvertisementReport.pdf';
        a.click();
        window.URL.revokeObjectURL(url);
        a.remove(); // remove the element
      }, error => {
        this.toastr.error('Error!', 'No se ha podido descargar el archivo');
      }, () => {
        console.log('Completed file download.')
      });
  }

  downloadCommissionReport() {
    this.http.get(this.rootURL + '/getCommissionReport', { responseType: 'arraybuffer' })
      .subscribe(res => {
        var url = window.URL.createObjectURL(new Blob([res]));
        var a = document.createElement('a');
        document.body.appendChild(a);
        a.setAttribute('style', 'display: none');
        a.href = url;
        a.download = 'CommissionReport.pdf';
        a.click();
        window.URL.revokeObjectURL(url);
        a.remove(); // remove the element
      }, error => {
        this.toastr.error('Error!', 'No se ha podido descargar el archivo');
      }, () => {
        console.log('Completed file download.')
      });
  }

  downloadSalesReport(startDate: string, endDate: string) {
    const body = {
      StartDate: startDate,
      EndDate: endDate
      //StartDate : "1/1/2019",
      //EndDate : "4/1/2019"
    }
    this.http.post(this.rootURL + '/getSalesReport', body, { responseType: 'arraybuffer' })
      .subscribe(res => {
        var url = window.URL.createObjectURL(new Blob([res]));
        var a = document.createElement('a');
        document.body.appendChild(a);
        a.setAttribute('style', 'display: none');
        a.href = url;
        a.download = 'SalesReport.pdf';
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
