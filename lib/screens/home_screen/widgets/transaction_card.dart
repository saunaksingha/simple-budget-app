import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transactionTitle,
    required this.transactionWallet,
    required this.transactionTime,
    required this.transactionCategory,
    required this.transactionType,
    required this.transactionAmount,
  });
  final double transactionAmount;
  final String transactionTitle;
  final String transactionWallet;
  final String transactionTime;
  final TransactionCategory transactionType;
  final dynamic transactionCategory;

  @override
  Widget build(BuildContext context) {
    Widget transactionBadge() {
      if (transactionType == TransactionCategory.income) {
        return incomeCategoryWidget(
          context: context,
          incomeCategory: transactionCategory as IncomeCategory,
          height: 44,
          width: 44,
        );
      }
      return expenseCategoryWidget(
        context: context,
        expenseCategory: transactionCategory as ExpenseCategory,
        height: 44,
        width: 44,
      );
    }

    return Container(
      padding: context.edgeInsets(horizontal: AppSpacing.sm),
      height: context.h(64),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundCardColour,
        borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColourPrimary.withValues(alpha: 0.08),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          transactionBadge(),
          SizedBox(width: context.w(8)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transactionTitle,
                  style: AppTextStyles.primaryTextSemiBold(context).copyWith(
                    color: AppColors.textColourPrimary,
                    fontSize: context.sp(14),
                  ),
                ),
                Text(
                  transactionWallet,
                  style: AppTextStyles.primaryTextRegular(context).copyWith(
                    color: AppColors.textColourBody.withValues(alpha: 0.4),
                    fontSize: context.sp(14),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-\$${transactionAmount}",
                style: AppTextStyles.primaryTextRegular(
                  context,
                ).copyWith(color: AppColors.textColourPrimary),
              ),
              Text(
                transactionTime,
                style: AppTextStyles.bodyTextRegular(context).copyWith(
                  color: AppColors.textColourBody.withValues(alpha: 0.25),
                  fontSize: context.sp(14),
                  height: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(width: context.w(AppSpacing.sm)),
        ],
      ),
    );
  }
}
