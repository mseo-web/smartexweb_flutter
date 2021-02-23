import 'package:mobx/mobx.dart';
import 'package:smartexweb/services/api/rest_service.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {

  @observable
  List categoriesAll = [];

  @action
  Future initCategories() async {
    var customCategories = [
      {"id": 99, "name": "ВСЕ", "description": "all"},
    ];
    var serverCategoriesData;
    serverCategoriesData = await RestService().getCategoriesData();
    for (var i = 0; i < serverCategoriesData.length; i++) {
      var categoryItem = {"id": serverCategoriesData[i]['id'], "name": serverCategoriesData[i]['name'], "description": serverCategoriesData[i]['description']};
      customCategories.add(categoryItem);
    }
    categoriesAll = customCategories;
  }
}
