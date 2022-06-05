import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_work_elki/core/error/failure.dart';
import 'package:test_work_elki/core/usecase/usecase.dart';
import 'package:test_work_elki/features/list_of_houses/domain/entitys/house_entity.dart';
import 'package:test_work_elki/features/list_of_houses/domain/repositories/house_repos.dart';

class GetHouses extends UseCases<List<HouseEntity>, GetHouseParams> {
  final HouseRepository _repository;
  GetHouseParams? params;
  GetHouses(this._repository, [params]);

  @override
  Future<Either<Failure, List<HouseEntity>>> call(
      GetHouseParams? params) async {
    return await _repository.getHouseList();
    
  }
}

class GetHouseParams extends Equatable {
  @override
  List<Object?> get props => [];
}
