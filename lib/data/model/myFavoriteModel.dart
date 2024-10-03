import 'package:ecommerce_app/data/model/itemsModel.dart';

class MyFavoriteModel extends itemsModel{
  int? favoriteId;
  int? favoriteUserid;
  int? favoriteItemsid;
  int? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteItemsid,
      super.itemsId,
      super.itemsName,
      super.itemsNameAr,
      super.itemsDesc,
      super.itemsDescAr,
      super.itemsImage,
      super.itemsCount,
      super.itemsActive,
      super.itemsPrice,
      super.itemsDiscount,
      super.itemsDate,
      super.itemsCat,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteItemsid = json['favorite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> MyFavoriteModel = new Map<String, dynamic>();
    MyFavoriteModel['favorite_id'] = this.favoriteId;
    MyFavoriteModel['favorite_userid'] = this.favoriteUserid;
    MyFavoriteModel['favorite_itemsid'] = this.favoriteItemsid;
    MyFavoriteModel['items_id'] = this.itemsId;
    MyFavoriteModel['items_name'] = this.itemsName;
    MyFavoriteModel['items_name_ar'] = this.itemsNameAr;
    MyFavoriteModel['items_desc'] = this.itemsDesc;
    MyFavoriteModel['items_desc_ar'] = this.itemsDescAr;
    MyFavoriteModel['items_image'] = this.itemsImage;
    MyFavoriteModel['items_count'] = this.itemsCount;
    MyFavoriteModel['items_active'] = this.itemsActive;
    MyFavoriteModel['items_price'] = this.itemsPrice;
    MyFavoriteModel['items_discount'] = this.itemsDiscount;
    MyFavoriteModel['items_date'] = this.itemsDate;
    MyFavoriteModel['items_cat'] = this.itemsCat;
    MyFavoriteModel['users_id'] = this.usersId;
    return MyFavoriteModel;
  }
}
