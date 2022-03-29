import 'package:injectable/injectable.dart';

import 'package:bikes/base/base.dart';
import 'package:bikes/models/models.dart';
import 'package:bikes/screens/details/details_screen_m.dart';

@injectable
class DetailsScreenViewModel extends BaseViewModel<DetailsScreenState> {
  DetailsScreenViewModel() : super(const Initializing());

  void loadBikeDetails(Bike bikeDetails) => emit(Loaded(bikeDetails));
}
