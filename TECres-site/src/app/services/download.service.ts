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

  getPDF2(): string {
    return '/assets/proyecto.pdf';
  }

  Download() {
    this.http.get(this.rootURL + '/api/getAdvertisementReport', { responseType: 'arraybuffer' })
      .subscribe((res) => {
        this.writeContents(res, 'test.pdf', 'application/pdf'); // file extension
      });
  }

  writeContents(content, fileName, contentType) {
    const a = document.createElement('a');
    const file = new Blob([content], { type: contentType });
    a.href = URL.createObjectURL(file);
    a.download = fileName;
    a.click();
  }

  downloadFile() {
    this.http.get(this.rootURL + '/api/getAdvertisementReport', { responseType: 'arraybuffer' })
      .subscribe(res => {
          console.log('start download:',res);
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
          console.log('download error:', JSON.stringify(error));
        }, () => {
          console.log('Completed file download.')
        });
  }
}
