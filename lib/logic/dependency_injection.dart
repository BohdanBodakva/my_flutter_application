import 'package:get/get.dart';
import 'package:my_flutter_application/logic/network_controller.dart';

class DependencyInjection {
  
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}
