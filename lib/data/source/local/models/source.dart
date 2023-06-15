import 'package:hive/hive.dart';

part 'source.g.dart';

@HiveType(typeId: 0)
class SourceHiveModel extends HiveObject {
  static const boxKey = 'source';

  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;
}
