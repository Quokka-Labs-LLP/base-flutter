import 'package:hive_flutter/hive_flutter.dart';

import '../../../db_operations_init.dart';

class SampleOperations extends Database {
  SampleOperations(this._box);

  final Box _box;

  @override
  Box get box => _box;

  @override
  T get<T>(final String id) {
    try {
      final data = box.get(id);

      if (data == null) {
        throw Exception('$T not in the box.');
      }

      return data;
    } on Exception  catch (_) {
      rethrow;
    }
  }

  @override
  List<T> getAll<T>() {
    try {
      final data = box.toMap().values;

      if (data.isEmpty) {
        throw Exception('$T not in the box.');
      }

      return data.toList().cast<T>();
    } on Exception  catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(final int id) async {
    try {
      await box.delete(id);
    } on Exception  catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> addUpdate<T>(final String id, final T item) async {
    try {
      await box.put(id, item);
    }  on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAll(final List<String> keys) async {
    try {
      await box.deleteAll(keys);
    }  on Exception catch (_) {
      rethrow;
    }
  }
  
  @override
  Future<void> add<T>(final T item) async{
    try {
      await box.add(item);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
