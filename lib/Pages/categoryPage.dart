// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Pages/collection.dart';
import 'package:shop_app/model/firebase_helper/firebase_firestore.dart';
import 'package:shop_app/model/categaryModel.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> categoriesList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCategoryList();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
     FirebaseFirestoreHelper.instance.updateTokenFromFirebase();
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    setState(() {
      isLoading = false;
    });
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: categoriesList
                    .map(
                      (e) => CategorySelect(
                        imageUrl: e.image,
                        categoryModel: e,
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
class CategorySelect extends StatelessWidget {
  final String imageUrl;
  final CategoryModel categoryModel;

  const CategorySelect({super.key, 
    required this.imageUrl,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Get.to(() => CollectionPage(categoryModel: categoryModel),);  
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 240,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), 
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), 
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover, 
            ),
          ),
        ),
      ),
    );
  }
}

