import 'package:flutter/material.dart';
import 'package:spy_game_responsive/shared/components/counter_btn.dart';
import 'package:spy_game_responsive/shared/theme.dart';

@immutable
class CounterTile extends StatelessWidget {
  final ValueNotifier<int> value = ValueNotifier<int>(5);
  final int minValue;
  final IconData icon;
  CounterTile(
      {required int startValue,
      required this.icon,
      Key? key,
      required this.minValue})
      : super(key: key) {
    value.value = startValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 45,
          ),
          Text(
            ':',
            style: theme().textTheme.bodyText2!.copyWith(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              counterBtn('-', () {
                if (value.value > minValue) {
                  value.value--;
                }
              }),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: ValueListenableBuilder(
                    valueListenable: value,
                    builder: (context, _, __) {
                      return Text(
                        value.value.toString(),
                        style:
                            theme().textTheme.bodyText2!.copyWith(fontSize: 30),
                      );
                    }),
              ),
              counterBtn('+', () {
                if (value.value < 100) {
                  value.value++;
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
