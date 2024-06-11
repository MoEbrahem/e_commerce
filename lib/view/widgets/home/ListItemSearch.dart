import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemSearch extends GetView<HomeControllerImp> {
  final List<itemsModel> listdataModel;
  const ListItemSearch({super.key, required this.listdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listdataModel.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.gotopageproductDetails(listdataModel[index]);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "${AppLink.itemsImage}/${listdataModel[index].itemsImage}",
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text("${listdataModel[index].itemsName}"),
                      subtitle: Text("${listdataModel[index].categoriesName}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
