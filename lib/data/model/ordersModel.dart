class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersPrice;
  int? ordersTotalprice;
  String? ordersPricedelivery;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersType;
  String? ordersCoupon;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressLat;
  String? addressLong;
  String? addressStreet;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersPricedelivery,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersType,
      this.ordersCoupon,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressLat,
      this.addressLong,
      this.addressStreet});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUsersid = json['orders_usersid'].toString();
    ordersAddress = json['orders_address'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersTotalprice = json['orders_totalprice'];
    ordersPricedelivery = json['orders_pricedelivery'].toString();
    ordersRating = json['orders_rating'].toString();
    ordersNoterating = json['orders_noterating'].toString();
    ordersType = json['orders_type'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersPaymentmethod = json['orders_paymentmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    ordersDatetime = json['orders_datetime'].toString();
    addressId = json['address_id'].toString();
    addressUserid = json['address_userid'].toString();
    addressName = json['address_name'].toString();
    addressCity = json['address_city'].toString();
    addressLat = json['address_lat'].toString();
    addressLong = json['address_long'].toString();
    addressStreet = json['address_street'].toString();
  }
}
