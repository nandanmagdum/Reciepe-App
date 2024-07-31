import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reciepe_app/api/api_service.dart';
import 'package:reciepe_app/utils/app_router.dart';
import 'package:reciepe_app/widgets/widgets.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category: ${Get.arguments[1]}"),
      ),
      body: FutureBuilder(
        future: Get.arguments[0] == 0
            ? ApiService.filterByCategories(category: Get.arguments[1])
            : Get.arguments[0] == 1
                ? ApiService.getMealsByCountry(country: Get.arguments[1])
                : ApiService.getMealsByIngridents(ingrident: Get.arguments[1]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return AppWidgets.categoryTile(
                  function: () {
                    Get.toNamed(AppRouter.mealDetails,
                        arguments: snapshot.data![index]['idMeal']);
                  },
                  url: snapshot.data![index]['strMealThumb'],
                  title: snapshot.data![index]['strMeal']);
            },
          );
        },
      ),
    );
  }
}
