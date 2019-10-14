import { Component, OnInit } from '@angular/core';
import { DownloadService } from 'src/app/services/download.service';

@Component({
  selector: 'app-sales',
  templateUrl: './sales.component.html',
  styleUrls: ['./sales.component.css']
})
export class SalesComponent implements OnInit {

  constructor(private downloadService: DownloadService) { }

  blob : Blob;
  ngOnInit() {
  }
}
