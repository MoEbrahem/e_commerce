import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/middleware/MyMiddleware.dart';
import 'package:ecommerce_app/view/screens/Productdetails.dart';
import 'package:ecommerce_app/view/screens/address/add.dart';
import 'package:ecommerce_app/view/screens/address/addPartTwo.dart';
import 'package:ecommerce_app/view/screens/address/view.dart';
import 'package:ecommerce_app/view/screens/auth/SuccessSignup.dart';
import 'package:ecommerce_app/view/screens/auth/forgetPassword/VerifyCode.dart';
import 'package:ecommerce_app/view/screens/auth/forgetPassword/forgetPassword.dart';
import 'package:ecommerce_app/view/screens/auth/login.dart';
import 'package:ecommerce_app/view/screens/auth/forgetPassword/resetPassword.dart';
import 'package:ecommerce_app/view/screens/auth/signUp.dart';
import 'package:ecommerce_app/view/screens/auth/verifycodesignup.dart';
import 'package:ecommerce_app/view/screens/cart.dart';
import 'package:ecommerce_app/view/screens/checkOut.dart';
import 'package:ecommerce_app/view/screens/homeScreen.dart';
import 'package:ecommerce_app/view/screens/items.dart';
import 'package:ecommerce_app/view/screens/language.dart';
import 'package:ecommerce_app/view/screens/myfavorite.dart';
import 'package:ecommerce_app/view/screens/notification.dart';
import 'package:ecommerce_app/view/screens/onboarding.dart';
import 'package:ecommerce_app/view/screens/auth/forgetPassword/success_resetPassword.dart';
import 'package:ecommerce_app/view/screens/orders/archive.dart';
import 'package:ecommerce_app/view/screens/orders/details.dart';
import 'package:ecommerce_app/view/screens/orders/pending.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? route =
[


  GetPage(name: "/",            page:               ()=> const  Language(), 
  middlewares: 
  [
    MyMiddleware(),
  ]
  ),
  
  //             Auth
 
  GetPage(name: AppRoute.login, page:               ()=> const  Login()),
  GetPage(name: AppRoute.onBoarding, page:          ()=> const  onBoarding()),
  GetPage(name: AppRoute.signup, page:              ()=> const  SignUp()),
  GetPage(name: AppRoute.forgetpassword, page:      ()=> const  ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page:          ()=> const  VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page:       ()=> const  ResetPassword()),
  GetPage(name: AppRoute.successresetPassword, page:()=> const  SuccessResetPassword()),
  GetPage(name: AppRoute.successSignup, page:       ()=> const  SuccessSignup()),
  GetPage(name: AppRoute.verifyCodeSignup, page:    ()=> const  VerifyCodeSignup()),

  //   Home
  
  GetPage(name: AppRoute.HomePage, page:            ()=> const  HomeScreen()),
  GetPage(name: AppRoute.Items, page:               ()=> const  Items()),
  GetPage(name: AppRoute.productDetails, page:      ()=> const  Productdetails()),
  GetPage(name: AppRoute.myfavorite, page:          ()=> const  MyFavorite()),
  GetPage(name: AppRoute.notification, page:        ()=> const  NotificationScreen()),
  GetPage(name: AppRoute.mycart, page:              ()=> const  Cart()),
  GetPage(name: AppRoute.checkout, page:            ()=> const  CheckOut()),

  //   Address
  
  GetPage(name: AppRoute.addressView, page:         ()=> const  ViewAddress()),
  GetPage(name: AppRoute.addAddress, page:          ()=> const  AddAddress()),
  GetPage(name: AppRoute.addressDetails, page:      ()=> const  AddAddressDetails()),

  //   Orders
  
  GetPage(name: AppRoute.pending, page:             () => const PendingOrder()),
  GetPage(name: AppRoute.archive, page:             () => const ArchiveOrder()),
  GetPage(name: AppRoute.details, page:             () => const OrdersDetails()),



];


// Map<String, Widget Function(BuildContext)> routes = 
// {
//   AppRoute.login               :(context)     => const Login(),
//   AppRoute.onBoarding          :(context)     => const onBoarding(),
//   AppRoute.signup              :(context)     => const SignUp(),
//   AppRoute.forgetpassword      :(context)     => const ForgetPassword(),
//   AppRoute.verifyCode          :(context)     => const VerifyCode(),
//   AppRoute.resetPassword       :(context)     => const ResetPassword(),
//   AppRoute.successresetPassword:(context)     => const SuccessResetPassword(),
//   AppRoute.successSignup       :(context)     => const SuccessSignup(),
//   AppRoute.verifyCodeSignup    :(context)     => const VerifyCodeSignup(),
// };
