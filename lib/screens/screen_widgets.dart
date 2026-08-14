import 'package:flutter/material.dart';
import 'package:simple_budget_app/screens/add_transaction/add_transaction_screen.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class ScreenWidgets {
  static AppBar home(BuildContext context, int screenIndex) {
    if (screenIndex == 0) {
      return AppBar(
        backgroundColor: AppColors.backgroundCardColour,

        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        title: Text(
          "Home",
          style: AppTextStyles.primaryTextBold(
            context,
          ).copyWith(color: AppColors.secondryColour),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
        ],
      );
    } else if (screenIndex == 3) {
      return AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        title: Text(
          "Wallets",
          style: AppTextStyles.primaryTextBold(
            context,
          ).copyWith(color: AppColors.secondryColour),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      );
    }

    return AppBar();
  }

  static FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTransactionScree()),
        );
      },
      backgroundColor: AppColors.primaryColour,
      foregroundColor: AppColors.textColourPrimary,
      elevation: 6,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, size: 26),
    );
  }
}
