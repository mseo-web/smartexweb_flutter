import 'package:mobx/mobx.dart';
import 'package:smartexweb/services/api/rest_service.dart';

part 'projects_store.g.dart';

class ProjectsStore = _ProjectsStore with _$ProjectsStore;

abstract class _ProjectsStore with Store {

  @observable
  List projectsAll = [];

  @observable
  List projectsByCategory = [];

  @action
  Future projectsGetByCategory(category) async {
    if(projectsAll.length==0){
      projectsAll = await RestService().getProjectsData();
      if (category == 'all') {
      projectsByCategory = projectsAll;
      } else {
        projectsByCategory = [];
        for (var i = 0; i < projectsAll.length; i++){
          for (var n = 0; n < projectsAll[i]['categories'].length; n++){
            if (projectsAll[i]['categories'][n]['description'] == category) {
              projectsByCategory.add(projectsAll[i]);
            }
          }
        }
      }
    }else {
      if (category == 'all') {
      projectsByCategory = projectsAll;
      } else {
        projectsByCategory = [];
        for (var i = 0; i < projectsAll.length; i++){
          for (var n = 0; n < projectsAll[i]['categories'].length; n++){
            if (projectsAll[i]['categories'][n]['description'] == category) {
              projectsByCategory.add(projectsAll[i]);
            }
          }
        }
      }
    }
  }

  @action
  Future initProjects() async {
    projectsAll = await RestService().getProjectsData();
  }
}
