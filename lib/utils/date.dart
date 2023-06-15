import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String yMMMdFormat() => DateFormat.yMMMd().format(this);
}
