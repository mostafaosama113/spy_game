import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game_responsive/main.dart';
import 'package:spy_game_responsive/shared/components/location_tale.dart';
import 'bloc/locations_cubit.dart';
import 'bloc/locations_state.dart';

class LocationsScreen extends StatelessWidget {
  final LocationsCubit cubit;
  const LocationsScreen(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<LocationsCubit, LocationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = LocationsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => Dismissible(
                  key: Key(bloc.locationsModel[index].id.toString()),
                  onDismissed: (_) => bloc.deleteLocation(index: index),
                  child: locationTale(
                    locationModel: bloc.locationsModel[index],
                    onPressed: () => bloc.updateVisibility(index: index),
                  )),
              itemCount: bloc.locationsModel.length,
              separatorBuilder: (BuildContext context, int index) => Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
