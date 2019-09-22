import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { WelcomeComponent } from './welcome/welcome.component';
import { AuthGuard } from './authorization/auth.guard';
import { SiteAdminsComponent } from './Administration/site-admins/site-admins.component';
import { ForbiddenComponent } from './Miscellaneous/forbidden/forbidden.component';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './login/sign-up/sign-up.component';
import { SignInComponent } from './login/sign-in/sign-in.component';
import { SearchComponent } from './General/search/search.component';



const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  { path: 'home', component: WelcomeComponent, canActivate: [AuthGuard] },
  { path: 'search', component: SearchComponent },
  { path: 'forbidden', component: ForbiddenComponent, canActivate: [AuthGuard] },
  { path: 'SiteAdmins', component: SiteAdminsComponent, canActivate: [AuthGuard] , data: { roles: ['Admin'] }},
   {
    path: 'signup', component: LoginComponent,
    children: [{ path: '', component: SignUpComponent }]
},
{
    path: 'signin', component: LoginComponent,
    children: [{ path: '', component: SignInComponent }]
}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
