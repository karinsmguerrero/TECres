import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  user: User;
  roles : any[];

  constructor(private service: UserService) { }

  ngOnInit() {
    this.resetForm();
    this.service.getAllRoles().subscribe(
      (data : any)=>{
        data.forEach(obj => obj.selected = false);
        this.roles = data;
      }
    );
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.user = {
      UserName: '',
      Password: '',
      Email: '',
      FirstName: '',
      LastName: ''
    }

    if (this.roles)
    this.roles.map(x => x.selected = false);
  }

  onSubmit(form: NgForm) {
    var x = this.roles.filter(x => x.selected).map(y => y.Name);
    this.service.registerUser(form.value,x)
      .subscribe((data: any) => {
        if (data.Succeeded == true) {
          this.resetForm(form);
        }
          
      });
  }

  updateSelectedRoles(index) {
    this.roles[index].selected = !this.roles[index].selected;
  }

}