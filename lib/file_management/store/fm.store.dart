import 'package:daily_notes/preferences/preferences.dart';
import 'package:mobx/mobx.dart';

part 'fm.store.g.dart';

class FMStore = _FMStore with _$FMStore;

abstract class _FMStore with Store {
  final _prefs = Preferences();

  @observable
  String? defaultFolder;

  @computed
  String? get getDefaultFolder => defaultFolder = _prefs.defaultFolderPath;

  @action
  void setDefaultFolder(String? path) {
    defaultFolder = path;
    _prefs.defaultFolderPath = defaultFolder;
  }
}
