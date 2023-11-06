
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/usermodel.dart';
import 'package:shop_app/widgets/dimensions.dart';

import '../../provider/app_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? image;
  void takePicture() async{
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40,);
    if(value != null){
      setState(() {
        image= File(value.path);
      });
    }
  }
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,);
    return Scaffold(
       appBar: AppBar(
          centerTitle: true,
          title:const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        image ==null 
         ? GestureDetector(
            onTap: () {
              takePicture();
            },       
            child: const CircleAvatar(
              radius: 70,
              child: Icon(Icons.camera_alt),
            ),
          )
          : GestureDetector(
            onTap: () {
              takePicture();
            },     
            child: CircleAvatar(
              radius: 70,
             backgroundImage: FileImage(image!),
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation.name
    
            ),
          ),
           SizedBox(height: Dimensions.height10,),
           TextButton(
            onPressed:()async{
            UserModel userModel =appProvider.getUserInformation.copyWith(name: name.text);
            appProvider.updateUserinfoFirebase(context, userModel, image);
           
            },
            child: const Text("Update")
            )
        ],
      ),
    ),
    );
  }
}