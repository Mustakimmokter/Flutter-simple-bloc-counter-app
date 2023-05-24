
import 'package:dio/dio.dart';
import 'package:practice_block_one/shared/services/dio/index.dart';

class HttpService {

  static Dio dio = Dio(baseOptions)..interceptors.add(CustomInterceptors());

  static Map<String, dynamic> commonHeaders() => {'Accept-Language': 'en'};


  static Future<dynamic> getData(String url, {Map<String, dynamic>? body})async{

    try{
      print('Requested..............');
      final response = await dio.get<String>(
        url,
        data: body
      );
        print("Response: $response...................");

        return response;

    }on DioError catch(ex){
      print('DioError: ${ex.message}.............');
    }

  }



}