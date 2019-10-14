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
  pdfSrc:any;
  pdfsource: any;

  constructor(private downloadService: DownloadService) { }

  ngOnInit() {
    this.pdfSrc = this.downloadService.getPDF2();
  }

  download(){
    this.downloadService.downloadFile();
  }

}
