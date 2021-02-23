import 'package:mobx/mobx.dart';
import 'package:smartexweb/stores/modules/settings_store.dart';
import 'package:smartexweb/stores/modules/projects_store.dart';
import 'package:smartexweb/stores/modules/categories_store.dart';
part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  _MainStore(_preferencesService) {
    this.settings = SettingsStore(_preferencesService);
    this.projects = ProjectsStore();
    this.categories = CategoriesStore();
  }

  SettingsStore settings;
  ProjectsStore projects;
  CategoriesStore categories;
}
