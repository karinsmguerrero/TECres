import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { WelcomeComponent } from './welcome/welcome.component';
import { AuthGuard } from './authorization/auth.guard';
import { HomeComponent } from './home/home.component';
import { ForbiddenComponent } from './Miscellaneous/forbidden/forbidden.component';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './login/sign-up/sign-up.component';
import { SignInComponent } from './login/sign-in/sign-in.component';
import { SalesComponent } from './Reports/sales/sales.component';
import { AdvertisementComponent } from './Reports/advertisement/advertisement.component';


import { SearchComponent } from './General/search/search.component';
import { GhomeComponent } from './General/ghome/ghome.component';
import { RegisterComponent } from './General/register/register.component';


import { ChomeComponent } from './Clients/chome/chome.component';
import { CreatePropertyComponent } from './Clients/create-property/create-property.component';
import { MyPropertiesComponent } from './Clients/my-properties/my-properties.component';


import { ApprovalComponent } from './Administration/Advertisement/approval/approval.component';
import { AssignmentComponent } from './Administration/Advertisement/assignment/assignment.component';
import { TypeComponent } from './Administration/Advertisement/type/type.component';
import { BillingComponent } from './Administration/billing/billing.component';
import { CarrersComponent } from './Administration/carrers/carrers.component';
import { LocationComponent } from './Administration/location/location.component';
import { PropertyTypeComponent } from './Administration/property-type/property-type.component';
import { SalesAgentManagementComponent } from './Administration/sales-agent-management/sales-agent-management.component';
import { StatisticsComponent } from './Administration/Advertisement/statistics/statistics.component';
import { ClientProfileComponent } from './Administration/client-profile/client-profile.component';
import { SiteAdminsComponent } from './Administration/site-admins/site-admins.component';
import { EstateComponent } from './Administration/estate/estate.component';
import { GridPropertyComponent } from './General/grid-property/grid-property.component';
import { MessagingComponent } from './General/messaging/messaging.component';
import { CommissionsComponent } from './Reports/commissions/commissions.component';



const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  { path: 'home', component: GhomeComponent},
  { path: 'register', component: RegisterComponent},
  { path: 'advancedsearch', component: SearchComponent},

  { path: 'chome', component: ChomeComponent},
  { path: 'createproperty', component: CreatePropertyComponent},
  { path: 'myproperties', component: MyPropertiesComponent},
  { path: 'myadvertisements', component: AdvertisementComponent},
  { path: 'myprofile', component: MyPropertiesComponent},


  
  { path: 'welcome', component: WelcomeComponent},
  { path: 'advertising/approval', component: ApprovalComponent},
  { path: 'advertising/assignement', component: AssignmentComponent},
  { path: 'advertising/type', component: TypeComponent},
  { path: 'billing', component: BillingComponent},
  { path: 'careers', component: CarrersComponent},
  { path: 'location', component: LocationComponent},
  { path: 'propertytype', component: PropertyTypeComponent},
  { path: 'users/agents', component: SalesAgentManagementComponent},
  { path: 'users/admins', component: SiteAdminsComponent},
  { path: 'advertising/statistics', component: StatisticsComponent},
  { path: 'users/clients', component: ClientProfileComponent},
  { path: 'reports/sales', component: SalesComponent},
  { path: 'reports/commisions', component: CommissionsComponent},
  { path: 'reports/advertisement', component: AdvertisementComponent},
  { path: 'clientprofile', component: ClientProfileComponent},
  { path: 'estates', component: EstateComponent},
  { path: 'chat', component: MessagingComponent},


  { path: 'signup', component: SignUpComponent},
  { path: 'signin', component: LoginComponent}
  /*{ path: '', redirectTo: 'home', pathMatch: 'full' },
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
}*/
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }