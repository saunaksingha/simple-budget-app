import 'dart:io';

import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/db/models/wallet_model.dart';
import 'package:simple_budget_app/db/tabels/wallet_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class DBHelper {
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  Database? myDB;

  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {
    final permission = await Permission.manageExternalStorage.request();

    if (!permission.isGranted) {
      throw Exception('Storage permission not granted');
    }

    final externalDir = Directory('/storage/emulated/0/Documents/SimpleBudget');

    if (!await externalDir.exists()) {
      await externalDir.create(recursive: true);
    }

    print('DB directory: ${externalDir.path}');

    final dbPath = join(externalDir.path, 'budgetDB.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(WalletTable.createTable);
      },
    );
  }

  Future<bool> addWallet({
    required String walletName,
    required double startingBalance,
    required String creationDateTime,
    required WalletIcon walletIcon,
    required BadgeColor walletColour,
    required bool excludeBalance,
  }) async {
    print("Wallet Icon ${walletIcon.name}");

    String walletId = uuid.v7();

    var db = await getDB();

    int rowsAltered = await db.insert(WalletTable.tableName, {
      WalletTable.id: walletId,
      WalletTable.title: walletName,
      WalletTable.currentBalance: startingBalance,
      WalletTable.dateTime: creationDateTime,
      WalletTable.walletColour: walletColour.name,
      WalletTable.walletIcon: walletIcon.name,
      WalletTable.excludeBalance: excludeBalance,
    });

    return rowsAltered > 0;
  }

  Future<List<WalletModel>> getWallets() async {
    final db = await getDB();

    final List<Map<String, dynamic>> maps = await db.query(
      WalletTable.tableName,
    );

    return maps.map((map) => WalletModel.fromMap(map)).toList();
  }
}
