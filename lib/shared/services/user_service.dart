
import 'package:practice_block_one/shared/app_helper/api.dart';
import 'package:practice_block_one/shared/services/http_service.dart';

class UserServices {

  static Future<void> getUsers() async {


    final String url = '${ApiEndpoint.api}/carts';

    final response = await HttpService.getData(url);
  }



}