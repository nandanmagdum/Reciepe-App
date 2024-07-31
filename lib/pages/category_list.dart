import 'package:flutter/material.dart';
import 'package:reciepe_app/api/api_service.dart';
import 'package:get/get.dart';
import 'package:reciepe_app/utils/app_router.dart';
import 'package:reciepe_app/widgets/widgets.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reciepes by Category"),
      ),
      body: Get.arguments == 0
          ? FutureBuilder(
              // future: ApiService.getCategoryList(),
              future: ApiService.getCategoryList(),
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
                  itemBuilder: (context, index) => AppWidgets.categoryTile(
                      function: () {
                        Get.toNamed(AppRouter.categoryMeals, arguments: [
                          0,
                          snapshot.data![index]['strCategory']
                        ]);
                      },
                      subtitle: snapshot.data![index]['strCategoryDescription'],
                      url: snapshot.data![index]['strCategoryThumb'],
                      title: snapshot.data![index]['strCategory']),
                );
              },
            )
          : Get.arguments == 1
              ? FutureBuilder(
                  future: ApiService.getListOfCountries(),
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
                        return ListTile(
                          onTap: () {
                            Get.toNamed(AppRouter.categoryMeals, arguments: [
                              1,
                              snapshot.data![index]['strArea']
                            ]);
                          },
                          title: Text(
                            "${snapshot.data![index]['strArea']}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    );
                  },
                )
              : FutureBuilder(
                  future: ApiService.getListOfIngridents(),
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
                        return ListTile(
                          onTap: () {
                            Get.toNamed(AppRouter.categoryMeals, arguments: [
                              2,
                              snapshot.data![index]['strIngredient']
                            ]);
                          },
                          leading: Text(
                            "${index + 1}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            "${snapshot.data![index]['strIngredient']}",
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              Text(snapshot.data![index]['strDescription']),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
