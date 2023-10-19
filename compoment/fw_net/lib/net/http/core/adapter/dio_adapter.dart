import 'package:dio/dio.dart';
import 'package:fw_net/net/http/proxy/Proxy.dart';
import './net_adapter.dart';
import '../fw_error.dart';
import '../../request/base_request.dart';
import '../interceptor/auth_interceptor.dart';

class DioAdapter extends FwNetAdapter {
  @override
  Future<FwNetResponse<T>> send<T>(FwBaseRequest request) async {
    var response, options = Options(headers: request.header);

    var error;
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    Proxy.setProxy(dio);
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await dio.get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        if (request.isForm()) {
          response = await dio.post(request.url(),
              queryParameters: request.params, options: options);
        } else {
          response = await dio.post(request.url(),
              data: request.params, options: options);
        }
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await dio
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }

    if (error != null) {
      throw FwNetError(response?.statusCode ?? -1, error.toString(),
          data: await buildResponse(response, request));
    }
    return buildResponse(response, request);
  }

  ///构建FwNetResponse
  Future<FwNetResponse<T>> buildResponse<T>(
      Response? response, FwBaseRequest request) {
    return Future.value(FwNetResponse(
        //?.防止response为空
        data: response?.data,
        request: request,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
        extra: response));
  }
}
