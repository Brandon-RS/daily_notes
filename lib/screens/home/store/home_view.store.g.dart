// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewStore on _HomeViewStore, Store {
  late final _$currentViewAtom =
      Atom(name: '_HomeViewStore.currentView', context: context);

  @override
  HViewType get currentView {
    _$currentViewAtom.reportRead();
    return super.currentView;
  }

  @override
  set currentView(HViewType value) {
    _$currentViewAtom.reportWrite(value, super.currentView, () {
      super.currentView = value;
    });
  }

  late final _$_HomeViewStoreActionController =
      ActionController(name: '_HomeViewStore', context: context);

  @override
  void setCurrentView(HViewType view) {
    final _$actionInfo = _$_HomeViewStoreActionController.startAction(
        name: '_HomeViewStore.setCurrentView');
    try {
      return super.setCurrentView(view);
    } finally {
      _$_HomeViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStore() {
    final _$actionInfo = _$_HomeViewStoreActionController.startAction(
        name: '_HomeViewStore.clearStore');
    try {
      return super.clearStore();
    } finally {
      _$_HomeViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentView: ${currentView}
    ''';
  }
}
