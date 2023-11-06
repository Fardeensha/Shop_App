// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/login.dart';
import 'package:shop_app/Pages/order_page/order_page.dart';
import 'package:shop_app/Pages/profile/change_password.dart';
import 'package:shop_app/Pages/profile/edit_profile.dart';
import 'package:shop_app/model/firebase_helper/firebase_auth.dart';

import 'package:shop_app/widgets/dimensions.dart';

import '../../provider/app_provider.dart';
import '../favoritesproducts/favorite_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appProvider.getUserInformation.image==null
                  ? const Icon(Icons.person_2_outlined,size: 80,
                  )
                  :
                  CircleAvatar(
                    radius: 60,
                     backgroundImage: NetworkImage(appProvider.getUserInformation.image!),
                  ),
                  SizedBox(
                    width: Dimensions.width30,
                  ),
                  SizedBox(height: Dimensions.height10),
                  Text(appProvider.getUserInformation.name,style:const TextStyle(fontWeight: FontWeight.bold),),
                  Text(appProvider.getUserInformation.email),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                 InkWell(
                  onTap: () {
                  Get.to(() => EditProfilePage());
                  },
                   child: Container(
                    height: Dimensions.height40,
                    width: Dimensions.width150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.purple,
                    ),
                    child:const Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                                 ),
                 ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Column(
                    children: [
                      ListTile(
                        onTap: () {
                         Get.to(() => FavoritePage());
                        },
                        leading: const Icon(Icons.favorite),
                        title: const Text(
                          "Wishlist",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text("Your Most Loved Style"),
                        trailing: const Icon(Icons.navigate_next),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Get.to(() => OrderPage());
                        },
                        leading: const Icon(Icons.shopping_bag),
                        title: const Text(
                          "Your Orders",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Get.to(() => ChangePassword());
                        },
                        leading: Icon(Icons.change_circle_outlined),
                        title: Text(
                          "Change Password",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          FirebaseAuthHelper.instance.signOut();
                          Get.to(()=>LoginPage());

                          setState(() {});
                        },
                        leading: Icon(Icons.logout),
                        title: Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ],
                  ),
                  Text("Version 1.0.0"),
                ])));
  }
}
