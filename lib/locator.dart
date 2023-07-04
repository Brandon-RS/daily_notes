import 'package:daily_notes/file_management/store/fm.store.dart';
import 'package:daily_notes/screens/home/store/home_view.store.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HomeViewStore>(() => HomeViewStore());
  locator.registerLazySingleton<FMStore>(() => FMStore());
}
