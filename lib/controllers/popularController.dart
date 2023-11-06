// ignore_for_file: file_names
// import 'package:get/get.dart';
// import 'package:shop_app/data/api/repository/popular_repo.dart';
// import 'package:shop_app/model/productModel.dart';

// class PopularProductController extends GetxController{
//   final PopularRepo popularRepo;
//   PopularProductController({required this.popularRepo});

//   List<dynamic> _popularProductList=[];
//   List<dynamic> get popularProductList =>_popularProductList;

//   bool _isLoaded =false;
//   bool get isLoaded=>_isLoaded;

//   Future<void> getPopularProductList()async{
//   Response response = await  popularRepo.getPopularProductList();

//   if(response.statusCode==200){
//     print("got products");
//     _popularProductList=[];
//      _popularProductList.addAll(Product.fromJson(response.body).products);
//        _isLoaded=true;
//     update();
  
//   }else{

//   }
//   }
// }