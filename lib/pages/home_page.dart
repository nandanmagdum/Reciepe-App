import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reciepe_app/api/url_const.dart';
import 'package:reciepe_app/utils/app_router.dart';
import 'package:reciepe_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reciepe App"),
          centerTitle: true,
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppWidgets.categoryTile(
                    function: () {
                      Get.toNamed(AppRouter.categoryRouter, arguments: 0);
                    },
                    url: UrlConst.categoryImage,
                    title: "Recipe By Categories"),
                const SizedBox(
                  height: 25,
                ),
                AppWidgets.categoryTile(
                    function: () {
                      Get.toNamed(AppRouter.categoryRouter, arguments: 1);
                    },
                    url: UrlConst.countryImage,
                    title: "Recipe By Countries"),
                const SizedBox(
                  height: 25,
                ),
                AppWidgets.categoryTile(
                    function: () {
                      Get.toNamed(AppRouter.categoryRouter, arguments: 2);
                    },
                    url: UrlConst.ingridientImage,
                    title: "Recipe By Ingredients")
              ],
            ),
          ),
        ));
  }
}
