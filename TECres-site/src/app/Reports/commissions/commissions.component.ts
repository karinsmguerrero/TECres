import { Component, OnInit } from '@angular/core';
import { DownloadService } from 'src/app/services/download.service';

@Component({
  selector: 'app-commissions',
  templateUrl: './commissions.component.html',
  styleUrls: ['./commissions.component.css']
})
export class CommissionsComponent implements OnInit {

  pdfSrc:any;

  constructor(private downloadService: DownloadService) { }

  ngOnInit() {
   
  }
  
  get(){
    this.downloadService.getCommissionReport();
    this.pdfSrc = '/assets/Files/CommissionReport.pdf'
  }

  download(){
    this.downloadService.downloadCommissionReport();
  }

}