import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  final String title;
  const BaseWidget({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   color: Colors.grey,
          //   width: Get.width,
          //   alignment: Alignment.centerRight,
          //   child: Row(
          //     children: const [
          //       Icon(Icons.not_interested_rounded),
          //       SizedBox(width: 8,),
          //       Text("Offline"),
          //     ],
          //   ),
          // ),
          Expanded(child: child),

        ],
      ),
    );
  }
}
