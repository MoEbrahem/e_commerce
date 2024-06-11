class CouponModel {
  int? couponId;
  String? couponName;
  int? couponDiscount;
  String? couponExpiredate;
  int? couponCount;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponDiscount,
      this.couponExpiredate,
      this.couponCount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponDiscount = json['coupon_discount'];
    couponExpiredate = json['coupon_expiredate'];
    couponCount = json['coupon_count'];
  }
}
