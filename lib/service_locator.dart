import 'package:get_it/get_it.dart';
import 'package:test_work_elki/core/network/client_service.dart';
import 'package:test_work_elki/features/list_of_houses/data/datasources/house_remote_datasource.dart';
import 'package:test_work_elki/features/list_of_houses/data/repositories/house_repos.dart';
import 'package:test_work_elki/features/list_of_houses/domain/repositories/house_repos.dart';
import 'package:test_work_elki/features/list_of_houses/domain/usecases/house_usecase.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  // вообще блоки не обязательно регать, они создаются в мильтиблокпровайдере с модификатором lazy по умолчанию
  sl.registerFactory(
    () => MainScreenBlock(sl()),
  );

  //Usecases
  sl.registerLazySingleton<GetHouses>(() => GetHouses(sl()));
  sl.registerLazySingleton<GetHouseParams>(() => GetHouseParams());
  // Repository
  sl.registerLazySingleton<HouseRepository>(() => HouseRepositoryImpl(sl()));
  // DataSource
  sl.registerLazySingleton<HouseRemoteDataSource>(
      () => HouseRemoteDataSourceImpl(sl()));
  // Core
  sl.registerLazySingleton(() => ClientService());
}
