import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidgets {
  static Widget categoryTile(
          {required Function function,
          required String url,
          required String title,
          String? subtitle
          }) =>
      GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          // height: Get.height * 0.3,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.2,
                width: Get.width,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10,),
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
              // if(subtitle != null) Text(subtitle),
            ],
          ),
        ),
      );
}
