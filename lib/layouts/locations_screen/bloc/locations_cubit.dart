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
      SqfLite.getAllLocations().then((value) {
        for (var element in value) {
          locationsModel.add(LocationModel.fromJson(element));
        }
      });
      emit(GetAllLocationsSuccessState());
    }
  }

  void updateVisibility({required int index}) {
    locationsModel[index].isShow = !locationsModel[index].isShow;
    SqfLite.update(
            locationsModel[index].id, locationsModel[index].isShow ? 1 : 0)
        .then((value) => emit(UpdateVisibilityState()));
  }

  void deleteLocation({required int index}) {
    SqfLite.delete(locationsModel[index].id).then((value) {
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
    SqfLite.insert(locationName).then((id) {
      locationsModel
          .add(LocationModel(id: id, isShow: true, name: locationName));
      emit(AddLocationState());
    });
  }

  Future<List<LocationModel>> getAvailableLocation() async {
    List<LocationModel> availableLocation = [];
    List<Map<dynamic, dynamic>> json = await SqfLite.getVisibleLocations();
    for (var element in json) {
      availableLocation.add(LocationModel.fromJson(element));
    }
    return availableLocation;
  }
}
