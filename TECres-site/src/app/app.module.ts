import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from "@angular/forms";
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { SearchComponent } from './General/search/search.component';
import { MessagingComponent } from './General/messaging/messaging.component';
import { PropertyTypeComponent } from './Administration/property-type/property-type.component';
import { LocationComponent } from './Administration/location/location.component';
import { ClientProfileComponent } from './Administration/client-profile/client-profile.component';
import { CarrersComponent } from './Administration/carrers/carrers.component';
import { SiteAdminsComponent } from './Administration/site-admins/site-admins.component';
import { ApprovalComponent } from './Administration/Advertisement/approval/approval.component';
import { TypeComponent } from './Administration/Advertisement/type/type.component';
import { StatisticsComponent } from './Administration/Advertisement/statistics/statistics.component';
import { AssignmentComponent } from './Administration/Advertisement/assignment/assignment.component';
import { BillingComponent } from './Administration/billing/billing.component';
import { AdvertisingManagementComponent } from './Clients/advertising-management/advertising-management.component';
import { ClientRegisterComponent } from './Clients/client-register/client-register.component';
import { BuyerManagementComponent } from './General/buyer-management/buyer-management.component';
import { SalesAgentManagementComponent } from './Administration/sales-agent-management/sales-agent-management.component';
import { SalesComponent } from './Reports/sales/sales.component';
import { AdvertisementComponent } from './Reports/advertisement/advertisement.component';
import { CommissionsComponent } from './Reports/commissions/commissions.component';
import { NavigationComponent } from './Miscellaneous/navigation/navigation.component';
import { UserService } from './services/user.service';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { WelcomeComponent } from './welcome/welcome.component';
import { AuthGuard } from './authorization/auth.guard';
import { AuthInterceptor } from './authorization/auth.interceptor';
import { ForbiddenComponent } from './Miscellaneous/forbidden/forbidden.component';
import { SignUpComponent } from './login/sign-up/sign-up.component';
import { SignInComponent } from './login/sign-in/sign-in.component';
import { HomeComponent } from './home/home.component';
import { GhomeComponent } from './General/ghome/ghome.component';
import { RegisterComponent } from './General/register/register.component';
import { ChomeComponent } from './Clients/chome/chome.component';
import { CreatePropertyComponent } from './Clients/create-property/create-property.component';
import { MyPropertiesComponent } from './Clients/my-properties/my-properties.component';
import { MyProfileComponent } from './Clients/my-profile/my-profile.component';
import { AdminNavigationComponent } from './Miscellaneous/admin-navigation/admin-navigation.component';
import { ClientNavigationComponent } from './Miscellaneous/client-navigation/client-navigation.component';
import { GeneralNavigationComponent } from './Miscellaneous/general-navigation/general-navigation.component';
import { EstateComponent } from './Administration/estate/estate.component';
import { ConstantsService } from './services/constants.service';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { AngularDateTimePickerModule } from 'angular2-datetimepicker';
import {DpDatePickerModule} from 'ng2-date-picker';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    SearchComponent,
    MessagingComponent,
    PropertyTypeComponent,
    LocationComponent,
    ClientProfileComponent,
    CarrersComponent,
    SiteAdminsComponent,
    ApprovalComponent,
    TypeComponent,
    StatisticsComponent,
    AssignmentComponent,
    BillingComponent,
    AdvertisingManagementComponent,
    ClientRegisterComponent,
    BuyerManagementComponent,
    SalesAgentManagementComponent,
    SalesComponent,
    AdvertisementComponent,
    CommissionsComponent,
    NavigationComponent,
    SignUpComponent,
    WelcomeComponent,
    SignInComponent,
    ForbiddenComponent,
    HomeComponent,
    GhomeComponent,
    RegisterComponent,
    ChomeComponent,
    CreatePropertyComponent,
    MyPropertiesComponent,
    MyProfileComponent,
    AdminNavigationComponent,
    ClientNavigationComponent,
    GeneralNavigationComponent,
    EstateComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule, // required animations module
    ToastrModule.forRoot(), // ToastrModule added
    PdfViewerModule,
    AngularDateTimePickerModule
  ],
  /*providers: [UserService,AuthGuard,
    ,
    {
      provide : HTTP_INTERCEPTORS,
      useClass : AuthInterceptor,
      multi : true
    }],*/
    providers:[UserService,ConstantsService],
  bootstrap: [AppComponent]
})
export class AppModule { }
