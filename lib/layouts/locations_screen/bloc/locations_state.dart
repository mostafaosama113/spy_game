abstract class LocationsState {}

class LocationsInitial extends LocationsState {}

class GetAllLocationsLoadingState extends LocationsState {}

class GetAllLocationsSuccessState extends LocationsState {}

class GetAvailableLocationState extends LocationsState {}

class UpdateVisibilityState extends LocationsState {}

class DeleteLocationState extends LocationsState {}

class ToggleFABState extends LocationsState {}

class AddLocationState extends LocationsState {}
