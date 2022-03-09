import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/screens/bikes/bikes_screen_m.dart';

@injectable
class BikesScreenViewModel extends BaseViewModel<BikesScreenState> {
  BikesScreenViewModel() : super(const Loading());

  void loadBikes() async {
    //TODO: get bikes data from api or using preset data
  }
}
