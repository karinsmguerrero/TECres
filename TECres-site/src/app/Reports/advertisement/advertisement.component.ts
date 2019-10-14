import { Component, OnInit } from '@angular/core';
import { defaultOptions } from 'ngx-extended-pdf-viewer';
import { DownloadService } from 'src/app/services/download.service';

@Component({
  selector: 'app-advertisement',
  templateUrl: './advertisement.component.html',
  styleUrls: ['./advertisement.component.css']
})
export class AdvertisementComponent implements OnInit {

  page:number = 1;
  pdfSrc:string = '';

  constructor(private pdfService: DownloadService) { }

  ngOnInit() {
    this.pdfSrc = this.pdfService.getPDF2();
  }

  onFileSelected() {
    let img: any = document.querySelector("#file");

    if(typeof (FileReader) !== 'undefined') {
      let reader = new FileReader();

      reader.onload = (e:any) => {
        this.pdfSrc = e.target.result;
      }

      reader.readAsArrayBuffer(img.files[0]);
    }
  }

  download(){
    this.pdfService.downloadFile();
  }

}
