import { Component, OnInit } from '@angular/core';
import { DownloadService } from 'src/app/services/download.service';

@Component({
  selector: 'app-advertisement',
  templateUrl: './advertisement.component.html',
  styleUrls: ['./advertisement.component.css']
})
export class AdvertisementComponent implements OnInit {

  page: number = 1;
  pdfSrc: any;
  pdfsource: any;

  constructor(private downloadService: DownloadService) { }

  ngOnInit() {
   
  }

  get(){
    this.downloadService.getAdvertisementReport();
    this.pdfSrc = '/assets/Files/AdvertisementReport.pdf'
  }

  download() {
    this.downloadService.downloadAdvertisementReport();
  }

}