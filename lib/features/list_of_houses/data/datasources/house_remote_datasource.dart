import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_work_elki/core/network/client_service.dart';
import 'package:test_work_elki/features/list_of_houses/data/models/house_model.dart';

part 'house_remote_datasource.g.dart';

abstract class HouseRemoteDataSource {
  Future<List<HouseModel>> getHouseList();
}

@RestApi(baseUrl: "https://elki.rent/test")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/house.json')
  Future<List<HouseModel>> getHouseList();
}

class HouseRemoteDataSourceImpl extends HouseRemoteDataSource {
  ClientService client;
  HouseRemoteDataSourceImpl(this.client);

  @override
  Future<List<HouseModel>>  getHouseList()  async {
    return await RestClient(client.dio).getHouseList();
  }
}
