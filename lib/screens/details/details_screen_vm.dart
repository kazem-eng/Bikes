import 'package:injectable/injectable.dart';

import 'package:bike_catalog/base/base.dart';
import 'package:bike_catalog/models/models.dart';
import 'package:bike_catalog/screens/details/details_screen_m.dart';

@injectable
class DetailsScreenViewModel extends BaseViewModel<DetailsScreenState> {
  DetailsScreenViewModel() : super(const Initializing());

  void loadBikeDetails(Bike bikeDetails) => emit(Loaded(bikeDetails));
}
