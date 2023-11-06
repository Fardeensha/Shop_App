// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/cart_page/cartpage.dart';
import 'package:shop_app/Pages/order_page/check_out.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/provider/app_provider.dart';
import '../widgets/dimensions.dart';

class ItemScreen extends StatefulWidget {
  final ProductModel singleProduct;
  const ItemScreen({Key? key, required this.singleProduct}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                 Get.to(() => Cartpage());
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD4ECF7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(
              widget.singleProduct.image,
              height: 400,
              width: 400,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width15,
                top: Dimensions.height15,
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.singleProduct.isFavorite =
                          !widget.singleProduct.isFavorite;
                    });
                    if (widget.singleProduct.isFavorite) {
                      appProvider.addFavoriteProduct(widget.singleProduct);
                      ShowMessage("Added to favorites");
                    } else {
                      appProvider.removeFavoriteProduct(widget.singleProduct);
                      ShowMessage("Removed from favorites");
                    }
                  },
                  icon: Icon(appProvider.getfavoriteProductList
                          .contains(widget.singleProduct)
                      ? Icons.favorite
                      : Icons.favorite_border),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RatingBar.builder(
                          initialRating: 3.5,
                          minRating: 1,
                          itemCount: 5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      const Text("(450)"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.singleProduct.price.toString(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.singleProduct.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => Cartpage());
              },
              child: InkWell(
                onTap: () {
                  AppProvider appProvider =
                      Provider.of<AppProvider>(context, listen: false);
                  ProductModel productModel =
                      widget.singleProduct.copyWith(count: count);
                  appProvider.addCartProduct(productModel);
                  ShowMessage("Added to Cart");
                },
                child: Container(
                  height: Dimensions.height50,
                  width: Dimensions.width150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.purple,
                  ),
                  child: const Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ProductModel productModel =
                    widget.singleProduct.copyWith(count: count);
                appProvider.addCartProduct(productModel);
                Get.to(() => Checkout(
                      singleProduct: productModel,
                    ));
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
