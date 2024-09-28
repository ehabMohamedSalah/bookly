import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constant.dart';

@singleton
class ApiManager{
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: Constant.baseUrl,

      ),);
  }
  Future< Response > getRequest({ required String Endpoint,  Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers})async{
    var response=await dio.get( Endpoint,queryParameters: queryParameters,options: Options(
      headers: headers,
    ));
    return response;
  }

  Future<Response> postRequest({required String endpoint,Map<String, dynamic>? body,Map<String, dynamic>? headers})async{
    var response= await dio.post( endpoint, data: body,options: Options(
        headers: headers
    ));
    return response;
  }

  Future< Response > put({ required String Endpoint,  Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers})async{
    var response=await dio.put( Endpoint,queryParameters: queryParameters,options: Options(
      headers: headers,
    ));
    return response;
  }

  Future< Response > delete({ required String Endpoint,  Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers})async{
    var response=await dio.delete( Endpoint,queryParameters: queryParameters,options: Options(
      headers: headers,
    ));
    return response;
  }

}

/*

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}*/
