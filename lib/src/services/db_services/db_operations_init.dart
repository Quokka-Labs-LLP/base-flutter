
import 'package:hive_flutter/hive_flutter.dart';

abstract class Database {
  Box get box;
  T get<T>(String id);
  List<T> getAll<T>();
  Future<void> delete(int id);
  Future<void> deleteAll(List<String> keys);
  Future<void> addUpdate<T>(String id, T item);
  Future<void> add<T>(T item);
}

// Sample extention

// class DatabaseImplementing implements Database {
//   const DatabaseImplementing(this._box);
  
//   final Box _box;
  
//   @override
//   Box get box => _box;

//   @override
//   T get<T>(String id) {
//     try {
//       final data = box.get(id);
      
//       if (data == null) {
//         throw Exception('$T not in the box.');
//       }
      
//       return data;
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   List<T> getAll<T>() {
//     try {
//       final data = box.toMap().values;
      
//       if (data.isEmpty) {
//         throw Exception('$T not in the box.');
//       }

//       return data.toList().cast<T>();
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> delete(int id) async {
//     try {
//       await box.delete(id);
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> addUpdate<T>(String id, T item) async {
//     try {
//       await box.put(id, item);
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> deleteAll(List<String> keys) async {
//     try {
//       await box.deleteAll(keys);
//     } catch (_) {
//       rethrow;
//     }
//   }
// }
