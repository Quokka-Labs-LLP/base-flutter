import 'package:hive_flutter/hive_flutter.dart';

import 'tables/sample_table/modal/sample_db_model.dart';
import 'tables/sample_table/operations/sample_db_operations.dart';


class DatabaseService {
  DatabaseService._internal();

  // create your table box here
  static late Box<SampleTable> _sampleBox;
  // register your table operations here
  static SampleOperations get animalDbService => SampleOperations(_sampleBox);

  static Future<void> init() async {
    await Hive.initFlutter();
    await _registerAdapters();
  }

  static Future<void> _registerAdapters() async {
    // register all your adapters here before using
    Hive.registerAdapter(SampleTableAdapter());
    _sampleBox = await Hive.openBox<SampleTable>('sample');
  }
}
