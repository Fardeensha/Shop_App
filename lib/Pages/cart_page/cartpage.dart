// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/cart_page/cart_item_checkout.dart';
import 'package:shop_app/Pages/cart_page/single_cart.dart';
import 'package:shop_app/constants.dart';
import '../../provider/app_provider.dart';
import '../../widgets/dimensions.dart';


class Cartpage extends StatefulWidget {

  const Cartpage({
    Key? key,
  }) : super(key: key);

  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider =  Provider.of<AppProvider>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Dimensions.height150,
          child: Column(
            children: [
              Visibility(
                visible: appProvider.getCartProductList.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total"
                    ,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold )
                    ,),
                    Text("\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold )
                    ,),
                  
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height40,),
               Visibility(
                visible: appProvider.getCartProductList.isNotEmpty,
                 child: InkWell(
                  onTap: () {
                    appProvider.clearBuyProduct();
                    appProvider.addBuyProductCartList();
                    appProvider.clearCart();
                    if(appProvider.getBuyProductList.isEmpty){
                      ShowMessage("Cart is Empty");
                    }else{
                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartItemCheckout()));
                    }
                  },
                   child: Container(
                      height: Dimensions.height50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.red,
                      ),
                      child:const Center(
                        child: Text(
                          "Checkout",
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
            ],
          ),
        ),
      ),
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Cart",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:appProvider.getCartProductList.isEmpty 
      ? const Center(
        child: Text("Cart is Empty"),
      )
      : ListView.builder(
        itemCount: appProvider.getCartProductList.length,
        itemBuilder: ((context, index) {
          return SingleCart(
            singleProduct: appProvider.getCartProductList[index]);
        }),
    ),
      
    );
  }
  
}