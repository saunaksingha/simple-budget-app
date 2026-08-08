import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

enum TransactionCategory { expense, income, transfer }

enum ExpenseCategory {
  food,
  transportation,
  travel,
  shopping,
  bills,
  housing,
  healthcare,
  fitness,
  entertainment,
  subscriptions,
  personalCare,
  education,
  pets,
  gifts,
  finance,
  other,
}

const Map<ExpenseCategory, IconData> expenseCategoryIcons = {
  ExpenseCategory.food: Icons.restaurant_rounded,
  ExpenseCategory.transportation: Icons.directions_car_rounded,
  ExpenseCategory.travel: Icons.flight_rounded,
  ExpenseCategory.shopping: Icons.shopping_bag_rounded,
  ExpenseCategory.bills: Icons.receipt_long_rounded,
  ExpenseCategory.housing: Icons.home_rounded,
  ExpenseCategory.healthcare: Icons.medical_services_rounded,
  ExpenseCategory.fitness: Icons.fitness_center_rounded,
  ExpenseCategory.entertainment: Icons.movie_rounded,
  ExpenseCategory.subscriptions: Icons.subscriptions_rounded,
  ExpenseCategory.personalCare: Icons.face_rounded,
  ExpenseCategory.education: Icons.school_rounded,
  ExpenseCategory.pets: Icons.pets_rounded,
  ExpenseCategory.gifts: Icons.card_giftcard_rounded,
  ExpenseCategory.finance: Icons.account_balance_wallet_rounded,
  ExpenseCategory.other: Icons.more_horiz_rounded,
};

enum IncomeCategory {
  salary,
  freelance,
  business,
  investment,
  interest,
  rental,
  gifts,
  refund,
  allowance,
  other,
}

const Map<IncomeCategory, IconData> incomeCategoryIcons = {
  IncomeCategory.salary: Icons.work_rounded,
  IncomeCategory.freelance: Icons.laptop_mac_rounded,
  IncomeCategory.business: Icons.business_rounded,
  IncomeCategory.investment: Icons.trending_up_rounded,
  IncomeCategory.interest: Icons.percent_rounded,
  IncomeCategory.rental: Icons.home_work_rounded,
  IncomeCategory.gifts: Icons.card_giftcard_rounded,
  IncomeCategory.refund: Icons.replay_rounded,
  IncomeCategory.allowance: Icons.account_balance_rounded,
  IncomeCategory.other: Icons.more_horiz_rounded,
};

const Map<ExpenseCategory, Color> expenseCategoryBackgroundColors = {
  ExpenseCategory.food: Color(0xFFE8753D),
  ExpenseCategory.transportation: Color(0xFF3D78D8),
  ExpenseCategory.travel: Color(0xFF7657C7),
  ExpenseCategory.shopping: Color(0xFFD65383),
  ExpenseCategory.bills: Color(0xFFD95C5C),
  ExpenseCategory.housing: Color(0xFFB9783F),
  ExpenseCategory.healthcare: Color(0xFF3E9B76),
  ExpenseCategory.fitness: Color(0xFF3195A8),
  ExpenseCategory.entertainment: Color(0xFF8B5BC7),
  ExpenseCategory.subscriptions: Color(0xFF5968C9),
  ExpenseCategory.personalCare: Color(0xFFB95DB5),
  ExpenseCategory.education: Color(0xFF438DBD),
  ExpenseCategory.pets: Color(0xFF7FA34A),
  ExpenseCategory.gifts: Color(0xFFD64F68),
  ExpenseCategory.finance: Color(0xFFE9E9FF),
  ExpenseCategory.other: Color(0xFF77736F),
};

const Map<ExpenseCategory, Color> expenseCategoryIconColors = {
  ExpenseCategory.food: Color(0xFFFFE0C2),
  ExpenseCategory.transportation: Color(0xFFDCEBFF),
  ExpenseCategory.travel: Color(0xFFE8DEFF),
  ExpenseCategory.shopping: Color(0xFFFFDCE8),
  ExpenseCategory.bills: Color(0xFFFFDADA),
  ExpenseCategory.housing: Color(0xFFFFE5C9),
  ExpenseCategory.healthcare: Color(0xFFD7F5E8),
  ExpenseCategory.fitness: Color(0xFFD5F5FA),
  ExpenseCategory.entertainment: Color(0xFFEBD9FF),
  ExpenseCategory.subscriptions: Color(0xFFDDE3FF),
  ExpenseCategory.personalCare: Color(0xFFFFDFFF),
  ExpenseCategory.education: Color(0xFFD9F0FF),
  ExpenseCategory.pets: Color(0xFFE8F5C9),
  ExpenseCategory.gifts: Color(0xFFFFD9E0),
  ExpenseCategory.finance: Color(0xFF5B5CE2),
  ExpenseCategory.other: Color(0xFFE7E4E0),
};

const Map<IncomeCategory, Color> incomeCategoryBackgroundColors = {
  IncomeCategory.salary: Color(0xFF3F8F68),
  IncomeCategory.freelance: Color(0xFF3D78D8),
  IncomeCategory.business: Color(0xFF7657C7),
  IncomeCategory.investment: Color(0xFF4C9A7A),
  IncomeCategory.interest: Color(0xFFE8F5E9),
  IncomeCategory.rental: Color(0xFFE0F2F1),
  IncomeCategory.gifts: Color(0xFFD65383),
  IncomeCategory.refund: Color(0xFFB9783F),
  IncomeCategory.allowance: Color(0xFFF3E5F5),
  IncomeCategory.other: Color(0xFF77736F),
};

const Map<IncomeCategory, Color> incomeCategoryIconColors = {
  IncomeCategory.salary: Color(0xFFD8F5E6),
  IncomeCategory.freelance: Color(0xFFDCEBFF),
  IncomeCategory.business: Color(0xFFE8DEFF),
  IncomeCategory.investment: Color(0xFFD7F5E8),
  IncomeCategory.interest: Color(0xFF2E7D32),
  IncomeCategory.rental: Color(0xFF00897B),
  IncomeCategory.gifts: Color(0xFFFFDCE8),
  IncomeCategory.refund: Color(0xFFFFE5C9),
  IncomeCategory.allowance: Color(0xFF7B1FA2),
  IncomeCategory.other: Color(0xFFE7E4E0),
};

Widget incomeCategoryWidget({
  required BuildContext context,
  required IncomeCategory incomeCategory,
  double? height,
  double? width,
}) {
  return Container(
    height: height ?? context.h(48),
    width: width ?? context.w(48),
    decoration: BoxDecoration(
      color: incomeCategoryBackgroundColors[incomeCategory],
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
    ),
    child: Icon(
      incomeCategoryIcons[incomeCategory],
      color: incomeCategoryIconColors[incomeCategory],
      size: context.sp(24),
    ),
  );
}

Widget expenseCategoryWidget({
  required BuildContext context,
  required ExpenseCategory expenseCategory,
  double? height,
  double? width,
}) {
  return Container(
    height: height ?? context.h(48),
    width: width ?? context.w(48),
    decoration: BoxDecoration(
      color: expenseCategoryBackgroundColors[expenseCategory],
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
    ),
    child: Icon(
      expenseCategoryIcons[expenseCategory],
      color: expenseCategoryIconColors[expenseCategory],
      size: context.sp(24),
    ),
  );
}
