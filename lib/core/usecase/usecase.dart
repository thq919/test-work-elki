import 'package:dartz/dartz.dart';
import 'package:test_work_elki/core/error/failure.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params? params);
}
 