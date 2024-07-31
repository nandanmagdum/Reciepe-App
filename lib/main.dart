import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reciepe_app/pages/category_list.dart';
import 'package:reciepe_app/pages/category_meals.dart';
import 'package:reciepe_app/pages/home_page.dart';
import 'package:reciepe_app/pages/meal_details.dart';
import 'package:reciepe_app/utils/app_router.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: AppRouter.homeRoute,
      getPages: [
        GetPage(name: AppRouter.homeRoute, page: () => const HomePage(),),
        GetPage(name: AppRouter.categoryRouter, page: () => const CategoryList(),),
        GetPage(name: AppRouter.categoryMeals, page: () => const CategoryMeals(),),
        GetPage(name: AppRouter.mealDetails, page: () => const MealDetails(),),
      ],
    );
  }
}
