import 'package:daily_notes/screens/home/helpers/view_type.dart';
import 'package:mobx/mobx.dart';

part 'home_view.store.g.dart';

class HomeViewStore = _HomeViewStore with _$HomeViewStore;

abstract class _HomeViewStore with Store {
  @observable
  HViewType currentView = HViewType.notes;

  @action
  void setCurrentView(HViewType view) => currentView = view;

  @action
  void clearStore() {}
}
