class AppLink {
  static const String server = "https://192.168.1.7/ecommerce";
  static const String test = "$server/test.php";

  //===============================   Auth  ===================================================

  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";

  static const String verifycode = "$server/auth/verifycode.php";
  static const String reSend = "$server/auth/resend.php";

  //==============================  ForgetPassword  ===========================================

  static const String checkEmail = "$server/forgetpassword/checkEmail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //==============================  Images  ====================================================

  static const String staticImages = "$server/upload";

  static const String categoriesImage = "$staticImages/categories";
  static const String itemsImage = "$staticImages/items";

  //===============================  Home  =====================================================

  static const String homePage = "$server/home.php";
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";

  //=============================== notification =====================================================

  static const String notification = "$server/notification.php";

  //=============================== Favorite =====================================================

  static const String addFavorite = "$server/favorite/add.php";
  static const String removeFavorite = "$server/favorite/remove.php";
  static const String viewFavorite = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/deleteFromFavorite.php";

  //=============================== Cart =====================================================

  static const String addCart      = "$server/cart/add.php";
  static const String deleteCart   = "$server/cart/delete.php";
  static const String getCountCart = "$server/cart/getcountitems.php";
  static const String viewCart     = "$server/cart/view.php";

  //=============================== address =====================================================

  static const String viewAddress   = "$server/address/view.php";
  static const String addAddress    = "$server/address/add.php";
  static const String editAddress   = "$server/address/edit.php";
  static const String deleteAddress = "$server/address/delete.php";

  //=============================== coupon =====================================================

  static const String checkcoupon   = "$server/coupon/checkCoupon.php";
  static const String offer         = "$server/offers.php";

  //=============================== checkout =====================================================

  static const String checkout      = "$server/orders/checkout.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String archiveOrders = "$server/orders/archive.php";

  //=================================== orders =====================================================

  static const String ordersDetails = "$server/orders/details.php";
  static const String deleteOrder   = "$server/orders/delete.php";
  static const String archiveOrder   = "$server/orders/archive.php";
  

  static const String rating         = "$server/rating.php";

}
