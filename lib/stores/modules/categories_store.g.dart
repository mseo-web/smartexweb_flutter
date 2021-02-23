// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesStore on _CategoriesStore, Store {
  final _$categoriesAllAtom = Atom(name: '_CategoriesStore.categoriesAll');

  @override
  List<dynamic> get categoriesAll {
    _$categoriesAllAtom.reportRead();
    return super.categoriesAll;
  }

  @override
  set categoriesAll(List<dynamic> value) {
    _$categoriesAllAtom.reportWrite(value, super.categoriesAll, () {
      super.categoriesAll = value;
    });
  }

  final _$initCategoriesAsyncAction =
      AsyncAction('_CategoriesStore.initCategories');

  @override
  Future<dynamic> initCategories() {
    return _$initCategoriesAsyncAction.run(() => super.initCategories());
  }

  @override
  String toString() {
    return '''
categoriesAll: ${categoriesAll}
    ''';
  }
}
