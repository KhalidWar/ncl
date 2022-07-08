import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ncl_assignment/models/cruise_ship/cruise_ship.dart';
import 'package:ncl_assignment/services/dio/dio_client.dart';

final shipServiceProvider = Provider<CruiseShipServices>((ref) {
  final dio = ref.read(dioClientProvider);
  return CruiseShipServices(dio: dio);
});

class CruiseShipServices {
  CruiseShipServices({required this.dio});
  final Dio dio;

  static const _cruiseShipUrl = '/cms-service/cruise-ships';

  Future<CruiseShip> fetchCruiseShipData(String shipName) async {
    try {
      final path = '$_cruiseShipUrl/$shipName';
      final response = await dio.get(path);
      return CruiseShip.fromJson(response.data);
    } on DioError catch (dioError) {
      throw dioError.message;
    } catch (error) {
      rethrow;
    }
  }
}
