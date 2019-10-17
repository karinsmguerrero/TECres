import { Component, OnInit } from '@angular/core';
import { DownloadService } from 'src/app/services/download.service';

@Component({
  selector: 'app-sales',
  templateUrl: './sales.component.html',
  styleUrls: ['./sales.component.css']
})
export class SalesComponent implements OnInit {

  constructor(private downloadService: DownloadService) { }

  pdfSrc: any;

  startDate: Date = new Date();
  endDate: Date = new Date();

  dummyDate: string;

  day: string;
  month: string;
  year: string;

  startSettings = {
    bigBanner: false,
    timePicker: false,
    format: 'shortDate',
    defaultOpen: false
  }

  endSettings = {
    bigBanner: false,
    timePicker: false,
    format: 'shortDate',
    defaultOpen: false
  }

  ngOnInit() {
  }

  get() {
    this.dummyDate = this.startDate as unknown as string;
    this.month = this.getMonth(this.dummyDate.substring(4, 7));
    this.day = this.dummyDate.substring(9, 10);
    this.year = this.dummyDate.substring(11, 15);
    const start = this.month + '/' + this.day + '/' + this.year;


    this.dummyDate = this.endDate as unknown as string;
    this.month = this.getMonth(this.dummyDate.substring(4, 7));
    this.day = this.dummyDate.substring(9, 10);
    this.year = this.dummyDate.substring(11, 15);
    const end = this.month + '/' + this.day + '/' + this.year;
    alert("start: " + start + " end: " + end); 

    this.downloadService.getSalesReport(start, end);
    this.pdfSrc = '/assets/Files/SalesReport.pdf'
  }

  download() {
    this.dummyDate = this.startDate as unknown as string;
    this.month = this.getMonth(this.dummyDate.substring(4, 7));
    this.day = this.dummyDate.substring(9, 10);
    this.year = this.dummyDate.substring(11, 15);
    const start = this.month + '/' + this.day + '/' + this.year;


    this.dummyDate = this.endDate as unknown as string;
    this.month = this.getMonth(this.dummyDate.substring(4, 7));
    this.day = this.dummyDate.substring(9, 10);
    this.year = this.dummyDate.substring(11, 15);
    const end = this.month + '/' + this.day + '/' + this.year;
    alert("start: " + start + " end: " + end);

    this.downloadService.downloadSalesReport(start, end);
  }

  getMonth(month: string) {
    if (month == 'Jan')
      return '01';
    if (month == 'Feb')
      return '02';
    if (month == 'Mar')
      return '03';
    if (month == 'Apr')
      return '04';
    if (month == 'May')
      return '05';
    if (month == 'Jun')
      return '06';
    if (month == 'Jul')
      return '07'
    if (month == 'Aug')
      return '08'
    if (month == 'Sep')
      return '09'
    if (month == 'Oct')
      return '10';
    if (month == 'Nov')
      return '11'
    if (month == 'Dec')
      return '12'
  }
}
