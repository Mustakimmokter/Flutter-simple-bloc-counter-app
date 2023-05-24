

import 'package:dio/dio.dart';
import 'package:practice_block_one/shared/app_helper/api.dart';
import 'package:practice_block_one/shared/constants/app_constants.dart';


BaseOptions baseOptions = BaseOptions(
  baseUrl: ApiEndpoint.api,
  connectTimeout: const Duration(seconds: AppConstants.connectionTimeOut),
  receiveTimeout: const Duration(seconds: AppConstants.responseTimeOut),
);