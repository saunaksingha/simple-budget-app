import 'package:uuid/uuid.dart';

enum TransactionType { income, expense, transfer }

var uuid = Uuid();

class Transaction {
  final String transactionId;
  final double amount;
  final TransactionType transactionType;
  final DateTime dateTime;
  final String transactionNote;

  Transaction({
    required this.amount,
    required this.transactionType,
    DateTime? dateTime,
    required this.transactionNote,
  }) : transactionId = uuid.v4(),
       dateTime = dateTime ?? DateTime.now();
}
