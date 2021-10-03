import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game_responsive/shared/colors.dart';
import 'package:spy_game_responsive/shared/components/location_tile.dart';
import 'package:spy_game_responsive/shared/theme.dart';
import 'bloc/locations_cubit.dart';
import 'bloc/locations_state.dart';

class LocationsScreen extends StatelessWidget {
  final LocationsCubit cubit;
  LocationsScreen(this.cubit, {Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    late String locationText;
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<LocationsCubit, LocationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = LocationsCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(),
            body: state is GetAllLocationsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : bloc.locationsModel.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) => Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 15),
                              color: Colors.red,
                              alignment: AlignmentDirectional.centerEnd,
                              child: const Icon(
                                  Icons.remove_circle_outline_outlined),
                            ),
                            key: Key(bloc.locationsModel[index].id.toString()),
                            onDismissed: (_) =>
                                bloc.deleteLocation(index: index),
                            child: locationTile(
                              locationModel: bloc.locationsModel[index],
                              onPressed: () =>
                                  bloc.updateVisibility(index: index),
                            )),
                        itemCount: bloc.locationsModel.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      )
                    : const Center(
                        child: Text('No locations'),
                      ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (bloc.isAdding) {
                  if (locationText.isNotEmpty) {
                    bloc.isAdding = true;
                    bloc.addNewLocation(locationText);
                    Navigator.pop(context);
                  }
                } else {
                  bloc.toggleFAB();
                  locationText = '';
                  scaffoldKey.currentState!
                      .showBottomSheet((context) {
                        return Container(
                          color: darkBlue,
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: TextField(
                                onChanged: (value) => locationText = value,
                                style: theme()
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 14),
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                autofocus: true,
                              ),
                            ),
                          ),
                        );
                      })
                      .closed
                      .then((value) {
                        bloc.toggleFAB();
                      });
                }
              },
              backgroundColor: Colors.teal,
              child: Icon(bloc.isAdding ? Icons.check : Icons.add),
            ),
          );
        },
      ),
    );
  }
}
