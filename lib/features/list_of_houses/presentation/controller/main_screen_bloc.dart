import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work_elki/features/list_of_houses/domain/entitys/house_entity.dart';
import 'package:test_work_elki/features/list_of_houses/domain/repositories/house_repos.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_events.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_states.dart';

class MainScreenBlock extends Bloc<MainScreenEvent, MainScreenState> {
  final HouseRepository _repository;
  List<HouseEntity>? mainScreenHomes;
  List<HouseEntity>? currentScreenHomes;

  MainScreenBlock(this._repository) : super(InitialState()) {
    on<MainScreenLoadEvent>((event, emit) async {
      emit(LoadingState());

      if (currentScreenHomes != null) {
        emit(LoadingCompleteSuccess(mainScreenHomes: currentScreenHomes));
      } else if (mainScreenHomes != null) {
        emit(LoadingCompleteSuccess(mainScreenHomes: mainScreenHomes));
      } else {
        try {
          final result = await _repository.getHouseList();
          result.fold((error) {
            emit(LoadingCompletedNoData());
          }, (data) {
            mainScreenHomes = data;
            currentScreenHomes = data;
            emit(LoadingCompleteSuccess(mainScreenHomes: data));
          });
        } catch (_) {
          emit(ErrorOnGettingData());
        }
      }
    });
    on<MainScreenAFrameSort>(((event, emit) {
      emit(LoadingState());
      List<dynamic> firstList = List.empty(growable: true);
      List<dynamic> secondList = List.empty(growable: true);
      for (var element in mainScreenHomes!) {
        element.type == 'a-frame'
            ? firstList.add(element)
            : secondList.add(element);
      }
      currentScreenHomes = [...firstList, ...secondList];
      emit(LoadingCompleteSuccess(mainScreenHomes: currentScreenHomes));
    }));
    on<MainScreenOFrameSort>(((event, emit) {
      emit(LoadingState());
      List<dynamic> firstList = List.empty(growable: true);
      List<dynamic> secondList = List.empty(growable: true);
      for (var element in mainScreenHomes!) {
        element.type == 'o-frame'
            ? firstList.add(element)
            : secondList.add(element);
      }
      currentScreenHomes = [...firstList, ...secondList];
      emit(LoadingCompleteSuccess(mainScreenHomes: currentScreenHomes));
    }));
    on<MainScreenILoveClickButtonsJustForFunReturnBackPlease>(((event, emit) {
      emit(LoadingState());
      emit(LoadingCompleteSuccess(mainScreenHomes: mainScreenHomes));
    }));
    on<MainScreenNeedToShowDescribe>(((event, emit) => emit(
        DescribeItemInProgress(
            entity: currentScreenHomes!.elementAt(event.entityIndex)))));
  }
}
