class OrdersDetailsModel {
  String? itemprice;
  String? itemcount;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? cartOrders;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;

  OrdersDetailsModel({
    this.itemprice,
    this.itemcount,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.cartOrders,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
  });

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemprice = json['itemprice'].toString();
    itemcount = json['itemcount'].toString();
    cartId = json['cart_id'].toString();
    cartUsersid = json['cart_usersid'].toString();
    cartItemsid = json['cart_itemsid'].toString();
    cartOrders = json['cart_orders'].toString();
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'].toString();
    itemsNameAr = json['items_name_ar'].toString();
    itemsDesc = json['items_desc'].toString();
    itemsDescAr = json['items_desc_ar'].toString();
    itemsImage = json['items_image'].toString();
    itemsCount = json['items_count'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDiscount = json['items_discount'].toString();
    itemsDate = json['items_date'].toString();
    itemsCat = json['items_cat'].toString();
  }
}
