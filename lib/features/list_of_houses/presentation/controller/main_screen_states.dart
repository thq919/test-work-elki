import 'package:test_work_elki/features/list_of_houses/domain/entitys/house_entity.dart';

abstract class MainScreenState {}

class InitialState extends MainScreenState {
  static List<HouseEntity>? mainScreenHomes;
  static casheMainScreenHome(List<HouseEntity> screenHomes) {
    mainScreenHomes = screenHomes;
  }

  InitialState();
}

class LoadingState extends MainScreenState {}

class ErrorOnGettingData extends MainScreenState {}

class LoadingCompletedNoData extends MainScreenState {}

class LoadingCompleteSuccess extends MainScreenState {
  final List<HouseEntity>? mainScreenHomes;
  LoadingCompleteSuccess({required this.mainScreenHomes})
      : assert(mainScreenHomes != null);
}

class DescribeItemInProgress extends MainScreenState {
  final HouseEntity? entity;
  DescribeItemInProgress({required this.entity}) : assert(entity != null);
}
