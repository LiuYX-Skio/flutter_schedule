import './adapter/mock_adapter.dart';
import '../request/base_request.dart';

import 'adapter/dio_adapter.dart';
import 'adapter/net_adapter.dart';
import 'fw_error.dart';

///1.支持网络库插拔设计，且不干扰业务层
///2.基于配置请求请求，简洁易用
///3.Adapter设计，扩展性强
///4.统一异常和返回处理
class FwNet {
  FwNet._();

  static FwNet? _instance;

  static FwNet getInstance() {
    _instance ??= FwNet._();
    return _instance!;
  }

  FwErrorInterceptor? _fwErrorInterceptor;

  Future fire(FwBaseRequest request) async {
    FwNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on FwNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      //其它异常
      error = e;
      printLog(e);
    }
    if (response == null) {
      printLog(error);
    }
    var result = response?.data;

    var hiError;

    var status = response?.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        hiError = NeedLogin();
        break;
      case 403:
        hiError = NeedAuth(result.toString(), data: result);
        break;
      default:
        hiError =
            error ?? FwNetError(status ?? -1, result.toString(), data: result);
    }

    if (_fwErrorInterceptor != null) {
      _fwErrorInterceptor!(hiError);
    }

    throw hiError;
  }

  //适配器模式，不同的架子，做不同的适配，实际上就是一个代理
  Future<FwNetResponse<T>> send<T>(FwBaseRequest request) async {
    ///使用Dio发送请求
    FwNetAdapter adapter = DioAdapter();
    // FwNetAdapter adapter = MockAdapter();
    return adapter.send(request);
  }

  void printLog(log) {
    print('fw_net:$log');
  }

  void setErrorInterceptor(FwErrorInterceptor interceptor) {
    this._fwErrorInterceptor = interceptor;
  }
}
