// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on _TimerStore, Store {
  late final _$nowAtom = Atom(name: '_TimerStore.now', context: context);

  @override
  DateTime get now {
    _$nowAtom.reportRead();
    return super.now;
  }

  @override
  set now(DateTime value) {
    _$nowAtom.reportWrite(value, super.now, () {
      super.now = value;
    });
  }

  late final _$testAtom = Atom(name: '_TimerStore.test', context: context);

  @override
  DateTime get test {
    _$testAtom.reportRead();
    return super.test;
  }

  @override
  set test(DateTime value) {
    _$testAtom.reportWrite(value, super.test, () {
      super.test = value;
    });
  }

  late final _$setRefreshTimeAsyncAction =
      AsyncAction('_TimerStore.setRefreshTime', context: context);

  @override
  Future setRefreshTime(DateTime newDateTime) {
    return _$setRefreshTimeAsyncAction
        .run(() => super.setRefreshTime(newDateTime));
  }

  @override
  String toString() {
    return '''
now: ${now},
test: ${test}
    ''';
  }
}
