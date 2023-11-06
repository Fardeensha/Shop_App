
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/categaryModel.dart';
import '../model/firebase_helper/firebase_firestore.dart';
import '../model/itemScreen.dart';
import '../model/product_model.dart';
import '../widgets/dimensions.dart';


class CollectionPage extends StatefulWidget {
 final CategoryModel categoryModel;
  const CollectionPage({super.key,required this.categoryModel});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {

  List<ProductModel> productModelList = [];
  bool isLoading = false; 
   void getCategoryList()async{
    setState(() {
      isLoading =true;
    });
   productModelList = await FirebaseFirestoreHelper.instance.getCategoryProducts(widget.categoryModel.id);
   productModelList.shuffle(); 
   setState(() {
     isLoading = false;
   });
  }
  
  @override
  void initState() {
   getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text("Collections",style: TextStyle(fontWeight: FontWeight.bold),),
        actions:const [
          Padding(
          padding:  EdgeInsets.only(right: 8),
          child: Icon(Icons.search),
        )],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: Dimensions.height100,
                width: Dimensions.width100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(widget.categoryModel.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  productModelList.isEmpty
                ? Center(
                  child: Text("Products is Empty"),
                )
               : GridView.builder(
                 itemCount: productModelList.length,
                 primary: false,
                 shrinkWrap: true,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 0.6,
                 ),
                 itemBuilder: (context, index) {
                   final products = productModelList[index]; 
                   return Container(
                     margin: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(Dimensions.radius10),
                       color: Color(0xFFD4ECF7),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black26,
                           blurRadius: 4,
                           spreadRadius: 2,
                         ),
                       ],
                     ),
                     child: Padding(
                       padding: EdgeInsets.all(8),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             '30% off',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 12,
                             ),
                           ),
                          Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10,bottom: Dimensions.height15),
                              child: InkWell(
                                onTap: () {
                                Get.to(() => ItemScreen(
                                          singleProduct: products),
                                    );
                                },
                                child: Image.network(
                                  products.image,
                                  height: Dimensions.height150,
                                ),
                              ),
                            ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               products.name,
                               style: TextStyle(
                                 fontSize: 17,
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             SizedBox(height: Dimensions.height10),
                             Text(
                               "\$${products.price}", 
                               style: TextStyle(
                                 fontSize: 15,
                                 color: Colors.redAccent,
                                 fontWeight: FontWeight.bold,
                               ),
                             )
                           ],
                             ),
                           ),
                 ] ),
                   ));
                 },
               ),
                ],
              ),
            ),
          )
    );
  }
}