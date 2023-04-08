import 'package:amimpact/core/common/models/home_model/home_model.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/common_service.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  HomeModel? model;

  Future init() async {
    await getHomeData();
  }

  Future getHomeData() async {
    model = await locator<CommonService>().getHomeData();
  }
}
