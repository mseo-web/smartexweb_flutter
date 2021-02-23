// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsStore on _ProjectsStore, Store {
  final _$projectsAllAtom = Atom(name: '_ProjectsStore.projectsAll');

  @override
  List<dynamic> get projectsAll {
    _$projectsAllAtom.reportRead();
    return super.projectsAll;
  }

  @override
  set projectsAll(List<dynamic> value) {
    _$projectsAllAtom.reportWrite(value, super.projectsAll, () {
      super.projectsAll = value;
    });
  }

  final _$projectsByCategoryAtom =
      Atom(name: '_ProjectsStore.projectsByCategory');

  @override
  List<dynamic> get projectsByCategory {
    _$projectsByCategoryAtom.reportRead();
    return super.projectsByCategory;
  }

  @override
  set projectsByCategory(List<dynamic> value) {
    _$projectsByCategoryAtom.reportWrite(value, super.projectsByCategory, () {
      super.projectsByCategory = value;
    });
  }

  final _$projectsGetByCategoryAsyncAction =
      AsyncAction('_ProjectsStore.projectsGetByCategory');

  @override
  Future<dynamic> projectsGetByCategory(dynamic category) {
    return _$projectsGetByCategoryAsyncAction
        .run(() => super.projectsGetByCategory(category));
  }

  final _$initProjectsAsyncAction = AsyncAction('_ProjectsStore.initProjects');

  @override
  Future<dynamic> initProjects() {
    return _$initProjectsAsyncAction.run(() => super.initProjects());
  }

  @override
  String toString() {
    return '''
projectsAll: ${projectsAll},
projectsByCategory: ${projectsByCategory}
    ''';
  }
}
