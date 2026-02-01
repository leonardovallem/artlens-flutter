import 'package:drift/drift.dart';
import 'package:drift/native.dart';

QueryExecutor createQueryExecutor() => DatabaseConnection(NativeDatabase.memory());