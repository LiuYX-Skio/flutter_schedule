import 'net_adapter.dart';
import '../../request/base_request.dart';

///测试适配器，mock数据
class MockAdapter extends FwNetAdapter {
  @override
  Future<FwNetResponse<T>> send<T>(FwBaseRequest request) async {
    return Future.delayed(Duration(milliseconds: 1000), () {
      return FwNetResponse(
          request: request,
          data: {"code": 0, "message": 'success', "data": "data"} as T,
          statusCode: 200);
    });
  }
}
