// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  final String title;
  final void Function()? onpressedSearch;
  final void Function()? onPressedIconFav;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;

  const Customappbar({
    super.key,
    required this.title,
    required this.onpressedSearch,
    required this.onPressedIconFav,
    this.onChanged,
    this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: onpressedSearch,
                      icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: title,
                  hintStyle: const TextStyle(
                    fontSize: 18,
                  )),
            ),
          ),
          
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 55,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: IconButton(
              onPressed: onPressedIconFav,
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          )
        ],
      ),
    );
  }
}
