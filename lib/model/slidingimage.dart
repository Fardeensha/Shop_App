
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/categaryModel.dart';
// Corrected the import path
import 'package:shop_app/model/firebase_helper/firebase_firestore.dart'; // Corrected the import path


class SlidingImage extends StatefulWidget {
  const SlidingImage({Key? key}) : super(key: key);

  @override
  State<SlidingImage> createState() => _SlidingImageState();
}

class _SlidingImageState extends State<SlidingImage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  List<CategoryModel> categoryModelList = []; // Corrected the variable name

  @override
  void initState() {
    super.initState();
    fetchNewCollections();
    pageController.addListener(() {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> fetchNewCollections() async { // Updated the return type to Future<void>
    categoryModelList = await FirebaseFirestoreHelper.instance.getNewCollections();
    // Use setState to rebuild the widget when data is fetched
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      CarouselSlider(
    items: categoryModelList.map((e) {
            return Image.network(e.image,);
          }).toList(),
   options: CarouselOptions(
      height: 300,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
   )
 ),
      
        Container(
          margin: const EdgeInsets.only(
              left: 20, right: 10), // Updated EdgeInsets to use actual values
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Products",
                style: GoogleFonts.notoSerif(fontSize: 20), // Adjust the font size as needed
              ),
              const Text(
                "See All",
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
        ),
      ],
    );
  }
}
