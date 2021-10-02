import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game_responsive/models/location_model.dart';
import 'package:spy_game_responsive/shared/network/sqflite.dart';
import 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitial());

  static LocationsCubit get(context) => BlocProvider.of(context);

  List<LocationModel> locationsModel = [];

  void getAllLocations() {
    if (locationsModel.isEmpty) {
      emit(GetAllLocationsLoadingState());
      SqlfLite.getAllLocations().then((value) {
        value.forEach((element) {
          locationsModel.add(LocationModel.fromJson(element));
        });
      });
      emit(GetAllLocationsSuccessState());
    }
  }

  void updateVisibility({required int index}) {
    locationsModel[index].isShow = !locationsModel[index].isShow;
    SqlfLite.update(
            locationsModel[index].id, locationsModel[index].isShow ? 1 : 0)
        .then((value) => emit(UpdateVisibilityState()));
  }

  void deleteLocation({required int index}) {
    SqlfLite.delete(locationsModel[index].id).then((value) {
      locationsModel.removeAt(index);
      emit(DeleteLocationState());
    });
  }

  bool isAdding = false;

  void toggleFAB() {
    isAdding = !isAdding;
    emit(ToggleFABState());
  }

  void addNewLocation(String locationName) {
    SqlfLite.insert(locationName).then((id) {
      locationsModel
          .add(LocationModel(id: id, isShow: true, name: locationName));
      emit(AddLocationState());
    });
  }
}
