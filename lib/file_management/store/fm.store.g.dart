// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fm.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FMStore on _FMStore, Store {
  Computed<String?>? _$defaultFolderComputed;

  @override
  String? get defaultFolder =>
      (_$defaultFolderComputed ??= Computed<String?>(() => super.defaultFolder,
              name: '_FMStore.defaultFolder'))
          .value;

  late final _$successMessageAtom =
      Atom(name: '_FMStore.successMessage', context: context);

  @override
  String? get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String? value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_FMStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  @override
  String toString() {
    return '''
successMessage: ${successMessage},
errorMessage: ${errorMessage},
defaultFolder: ${defaultFolder}
    ''';
  }
}
