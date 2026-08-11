import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/db/tabels/wallet_table.dart';

class WalletModel {
  final String id;
  final double currentBalance;
  final String walletName;
  final String creationDate;
  final BadgeColor colour;
  final WalletIcon walletIcon;
  final bool excludeBalance;

  WalletModel({
    required this.id,
    required this.currentBalance,
    required this.walletName,
    required this.creationDate,
    required this.colour,
    required this.walletIcon,
    required this.excludeBalance,
  });

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      id: map[WalletTable.id] as String,
      currentBalance: map[WalletTable.currentBalance] as double,
      walletName: map[WalletTable.title] as String,
      creationDate: map[WalletTable.dateTime] as String,
      excludeBalance: (map[WalletTable.excludeBalance] as String) == 'true',
      walletIcon: WalletIcon.values.byName(
        map[WalletTable.walletIcon] as String,
      ),
      colour: BadgeColor.values.byName(map[WalletTable.walletColour] as String),
    );
  }
}
