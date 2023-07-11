import 'package:daily_notes/preferences/preferences.dart';
import 'package:mobx/mobx.dart';

part 'fm.store.g.dart';

class FMStore = _FMStore with _$FMStore;

abstract class _FMStore with Store {
  final _prefs = Preferences();

  @observable
  String? successMessage;

  @observable
  String? errorMessage;

  void clearStore() {
    successMessage = null;
    errorMessage = null;
  }

  @computed
  String? get defaultFolder => _prefs.defaultFolderPath;

  set defaultFolder(String? path) {
    _prefs.defaultFolderPath = path;
  }
}
