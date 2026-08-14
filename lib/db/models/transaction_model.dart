class TransactionModel {
  final String id;
  final double amount;
  final String title;
  final String walletId;
  final DateTime dateTime;
  final String transactionType;
  final String transactionCategory;

  const TransactionModel({
    required this.id,
    required this.amount,
    required this.title,
    required this.walletId,
    required this.dateTime,
    required this.transactionType,
    required this.transactionCategory,
  });
}
