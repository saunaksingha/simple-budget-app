class WalletTable {
  static const String tableName = 'wallets';

  static const String id = '_id';
  static const String currentBalance = 'current_balance';
  static const String title = 'title';
  static const String dateTime = 'date_time';
  static const String walletColour = 'wallet_colour';
  static const String walletIcon = 'wallet_icon';
  static const String excludeBalance = 'exclude_balance';

  static const String createTable =
      '''
    CREATE TABLE $tableName (
      $id TEXT PRIMARY KEY,
      $currentBalance REAL NOT NULL,
      $title TEXT NOT NULL,
      $dateTime TEXT NOT NULL,
      $walletColour TEXT NOT NULL,
      $walletIcon TEXT NOT NULL,
      $excludeBalance TEXT NOT NULL
    )
  ''';
}
