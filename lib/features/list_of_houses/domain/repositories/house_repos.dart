import 'package:dartz/dartz.dart';
import 'package:test_work_elki/core/error/failure.dart';
import 'package:test_work_elki/features/list_of_houses/data/models/house_model.dart';

abstract class HouseRepository {
     Future<Either<Failure, List<HouseModel>>> getHouseList();
}