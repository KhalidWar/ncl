import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

const _cruiseShipMockData = {
  "shipName": "Test",
  "shipFacts": {
    "passengerCapacity": "4,004 (double occupancy)",
    "crew": "899",
    "inauguralDate": "1999",
  },
};

class MockDio extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    if (path.contains('error')) {
      throw DioError(
        type: DioErrorType.response,
        requestOptions: RequestOptions(path: path),
        error: 'Error Message',
      );
    }

    return Response<T>(
      data: _cruiseShipMockData as T?,
      statusCode: 200,
      requestOptions: RequestOptions(path: path),
    );
  }
}
