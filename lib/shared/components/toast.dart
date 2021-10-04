import 'package:flutter_toastr/flutter_toastr.dart';

void showToast(context, {required String msg}) {
  FlutterToastr.show(
    msg,
    context,
    duration: FlutterToastr.lengthLong,
    position: FlutterToastr.bottom,
  );
}
