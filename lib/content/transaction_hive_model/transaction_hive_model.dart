import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_hive_model.g.dart';

@HiveType(typeId: 2)
class TransactionHiveModel extends HiveObject {
  @HiveField(0)
  String transactionType;
  @HiveField(1)
  String name;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String autoPaymantType;
  @HiveField(4)
  String category;
  @HiveField(5)
  DateTime date;
  TransactionHiveModel({
    required this.transactionType,
    required this.name,
    required this.amount,
    required this.autoPaymantType,
    required this.category,
    required this.date,
  });
}
