import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/screens/home_screen/widgets/transaction_card.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.edgeInsets(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: context.h(38),
                width: context.w(38),
                decoration: BoxDecoration(
                  color: AppColors.secondryColour,
                  borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
                ),
                child: Icon(
                  LucideIcons.calendarRange,
                  color: AppColors.surfaceColor,
                  size: context.sp(20),
                ),
              ),
              SizedBox(width: context.w(4)),
              Container(
                width: context.w(2),
                height: context.h(24),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.r(24)),
                  color: AppColors.secondryColour.withValues(alpha: 0.25),
                ),
                child: Text("Test"),
              ),
              SizedBox(width: context.w(4)),
              Text(
                "05",
                style: AppTextStyles.primaryTextMedium(context).copyWith(
                  color: AppColors.secondryColour,
                  fontSize: context.sp(32),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: context.w(AppSpacing.sm)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tuesday',
                    style: AppTextStyles.bodyTextRegular(context).copyWith(
                      color: AppColors.textColourBody,
                      fontSize: context.sp(16),
                      height: 1.0,
                    ),
                  ),

                  SizedBox(height: context.h(2)),

                  Text(
                    'Aug 2026',
                    style: AppTextStyles.bodyTextRegular(context).copyWith(
                      color: AppColors.textColourBody.withValues(alpha: 0.25),
                      fontSize: context.sp(14),
                      height: 1.0,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "-\$32.00",
                style: AppTextStyles.primaryTextRegular(
                  context,
                ).copyWith(color: AppColors.textColourPrimary),
              ),
              SizedBox(width: context.w(8)),
            ],
          ),
          SizedBox(height: context.h(AppSpacing.sm)),
          TransactionCard(
            transactionAmount: 12,
            transactionTitle: "Tomato",
            transactionWallet: "Cash",
            transactionTime: "8:15 AM",
            transactionCategory: ExpenseCategory.bills,
            transactionType: TransactionType.expense,
          ),
        ],
      ),
    );
  }
}
