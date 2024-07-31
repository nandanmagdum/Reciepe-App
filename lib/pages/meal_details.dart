import 'package:flutter/material.dart';
import 'package:reciepe_app/api/api_service.dart';
import 'package:get/get.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reciepe"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder(
              future: ApiService.getMealById(id: Get.arguments),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }
                return Column(
                  children: [
                    Text(snapshot.data![0]['strMeal'], style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                    Image.network(snapshot.data![0]['strMealThumb']),
                    const SizedBox(height: 20,),
                    Text("Country : ${snapshot.data![0]['strArea']}"),
                    const SizedBox(height: 20,),
                    const Text("Instructions:"),
                    Text("${snapshot.data![0]['strInstructions']}"),
                    const SizedBox(height: 20,),
                  ],
                );
              },
          ),
        ),
      ),
    );
  }
}
