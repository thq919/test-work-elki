abstract class MainScreenEvent {}

class MainScreenInitialEvent extends MainScreenEvent {}

class MainScreenLoadEvent extends MainScreenEvent {}

class MainScreenLoadingEventDone extends MainScreenEvent {}

class MainScreenLoadingEventError extends MainScreenEvent {}

class MainScreenAFrameSort extends MainScreenEvent {}

class MainScreenOFrameSort extends MainScreenEvent {}

class MainScreenILoveClickButtonsJustForFunReturnBackPlease
    extends MainScreenEvent {}

class MainScreenNeedToShowDescribe extends MainScreenEvent {
  final int entityIndex;
  MainScreenNeedToShowDescribe(this.entityIndex);
}
