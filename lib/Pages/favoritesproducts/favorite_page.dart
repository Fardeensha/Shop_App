// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/favoritesproducts/single_favorite_card.dart';

import '../../provider/app_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
   AppProvider appProvider =  Provider.of<AppProvider>(context);
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text("Favorites",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.search),
        )],
      ),
      body:appProvider.getfavoriteProductList.isEmpty 
      ? const Center(
        child: Text("No Favorite Items"),
      )
      : ListView.builder(
        itemCount: appProvider.getfavoriteProductList.length,
        itemBuilder: ((context, index) {
          return SingleFavoriteCard(singleProduct: appProvider.getfavoriteProductList[index]);
        }),
    ),
      
    );
  }
}