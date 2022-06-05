import 'package:dartz/dartz.dart';
import 'package:test_work_elki/core/error/failure.dart';
import 'package:test_work_elki/features/list_of_houses/data/datasources/house_remote_datasource.dart';
import 'package:test_work_elki/features/list_of_houses/data/models/house_model.dart';
import 'package:test_work_elki/features/list_of_houses/domain/repositories/house_repos.dart';

class HouseRepositoryImpl extends HouseRepository {
  final HouseRemoteDataSource _remoteDataSource;
  HouseRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<HouseModel>>> getHouseList() async {
    try {
      return Right(await _remoteDataSource.getHouseList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
