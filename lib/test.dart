import 'package:ecommerce_app/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  initialData() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEST PAGE")),
      body: Container(
        child: Text("TEST"),
      ),
    );
  }
}
