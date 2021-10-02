import 'package:flutter/material.dart';
import 'package:spy_game_responsive/shared/components/counter_btn.dart';
import 'package:spy_game_responsive/shared/theme.dart';

@immutable
class CounterTale extends StatelessWidget {
  final ValueNotifier<int> value = ValueNotifier<int>(5);
  final int minValue;
  final IconData icon;
  CounterTale(
      {required int startValue,
      required this.icon,
      Key? key,
      required this.minValue})
      : super(key: key) {
    value.value = startValue;
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      //alignment: WrapAlignment.center,
      children: [
        Align(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: width * .08, top: 2),
            child: Icon(
              icon,
              size: 45,
            ),
          ),
          alignment: AlignmentDirectional.centerStart,
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
            counterBtn('+', () => value.value++),
          ],
        ),
      ],
    );
  }
}
