import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_budget_app/data/categories.dart';

class TransactionsTypeNotifier extends StateNotifier<TransactionType> {
  TransactionsTypeNotifier() : super(TransactionType.expense);

  void toggleTransactionType(TransactionType transactionType) {
    state = transactionType;
  }
}

final transactionTypeProvider =
    StateNotifierProvider<TransactionsTypeNotifier, TransactionType>((ref) {
      return TransactionsTypeNotifier();
    });
