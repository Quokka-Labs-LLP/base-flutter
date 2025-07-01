import 'package:hive_flutter/hive_flutter.dart';

part 'sample_db_model.g.dart';

@HiveType(typeId: 1)
class SampleTable extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String bread;
}
