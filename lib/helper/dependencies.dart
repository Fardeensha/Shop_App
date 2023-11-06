// import 'package:get/get.dart';
// import 'package:shop_app/app_constants.dart';
// import 'package:shop_app/controllers/popularController.dart';
// import 'package:shop_app/data/api/api_Client.dart';
// import 'package:shop_app/data/api/repository/popular_repo.dart';

// Future<void> init()async{
//   Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
//   //repository
//   Get.lazyPut(() => PopularRepo(apiClient: Get.find()));

//   //controllers
//   Get.lazyPut(() => PopularProductController(popularRepo: Get.find()));

// }