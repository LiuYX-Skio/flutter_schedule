import 'package:dio/dio.dart';

import '../../request/base_request.dart';
import '../fw_error.dart';
import 'net_adapter.dart';

class DioAdapter extends FwNetAdapter {
  @override
  Future<FwNetResponse<T>> send<T>(FwBaseRequest request) async {
    var response, options = Options(headers: request.header);

    var error;

    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio()
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
