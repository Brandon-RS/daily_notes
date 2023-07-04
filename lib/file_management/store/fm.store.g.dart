// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fm.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FMStore on _FMStore, Store {
  Computed<String?>? _$getDefaultFolderComputed;

  @override
  String? get getDefaultFolder => (_$getDefaultFolderComputed ??=
          Computed<String?>(() => super.getDefaultFolder,
              name: '_FMStore.getDefaultFolder'))
      .value;

  late final _$defaultFolderAtom =
      Atom(name: '_FMStore.defaultFolder', context: context);

  @override
  String? get defaultFolder {
    _$defaultFolderAtom.reportRead();
    return super.defaultFolder;
  }

  @override
  set defaultFolder(String? value) {
    _$defaultFolderAtom.reportWrite(value, super.defaultFolder, () {
      super.defaultFolder = value;
    });
  }

  late final _$_FMStoreActionController =
      ActionController(name: '_FMStore', context: context);

  @override
  void setDefaultFolder(String? path) {
    final _$actionInfo = _$_FMStoreActionController.startAction(
        name: '_FMStore.setDefaultFolder');
    try {
      return super.setDefaultFolder(path);
    } finally {
      _$_FMStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
defaultFolder: ${defaultFolder},
getDefaultFolder: ${getDefaultFolder}
    ''';
  }
}
