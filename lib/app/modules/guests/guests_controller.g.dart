// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GuestsController on _GuestsBase, Store {
  final _$allGuestsAtom = Atom(name: '_GuestsBase.allGuests');

  @override
  Stream<List<UserModel>> get allGuests {
    _$allGuestsAtom.context.enforceReadPolicy(_$allGuestsAtom);
    _$allGuestsAtom.reportObserved();
    return super.allGuests;
  }

  @override
  set allGuests(Stream<List<UserModel>> value) {
    _$allGuestsAtom.context.conditionallyRunInAction(() {
      super.allGuests = value;
      _$allGuestsAtom.reportChanged();
    }, _$allGuestsAtom, name: '${_$allGuestsAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_GuestsBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$_GuestsBaseActionController = ActionController(name: '_GuestsBase');

  @override
  void filterGuestByName(dynamic value) {
    final _$actionInfo = _$_GuestsBaseActionController.startAction();
    try {
      return super.filterGuestByName(value);
    } finally {
      _$_GuestsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool filterByIndex(dynamic guest) {
    final _$actionInfo = _$_GuestsBaseActionController.startAction();
    try {
      return super.filterByIndex(guest);
    } finally {
      _$_GuestsBaseActionController.endAction(_$actionInfo);
    }
  }
}
