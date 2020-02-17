// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_registration_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompleteRegistrationController on _CompleteRegistrationBase, Store {
  final _$errorMessageAtom =
      Atom(name: '_CompleteRegistrationBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$finishRegistrationAsyncAction = AsyncAction('finishRegistration');

  @override
  Future<bool> finishRegistration(dynamic userID, dynamic userEmail) {
    return _$finishRegistrationAsyncAction
        .run(() => super.finishRegistration(userID, userEmail));
  }

  final _$_CompleteRegistrationBaseActionController =
      ActionController(name: '_CompleteRegistrationBase');

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_CompleteRegistrationBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_CompleteRegistrationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSurname(String value) {
    final _$actionInfo =
        _$_CompleteRegistrationBaseActionController.startAction();
    try {
      return super.setSurname(value);
    } finally {
      _$_CompleteRegistrationBaseActionController.endAction(_$actionInfo);
    }
  }
}
