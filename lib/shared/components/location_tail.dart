import 'package:flutter/material.dart';
import 'package:spy_game_responsive/models/location_model.dart';

locationTale(
    {required LocationModel locationModel, required Function() onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      // vertical: 5,
    ),
    child: Row(
      children: [
        Text(
          locationModel.name,
        ),
        const Spacer(),
        IconButton(
          onPressed: () => onPressed(),
          icon: Icon(
            locationModel.isShow ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
