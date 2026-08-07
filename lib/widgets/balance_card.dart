import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/add_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/utils/formatter.dart';
import 'package:simple_budget_app/widgets/chips/stat_chip.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: AppColors.backgroundColour,
      child: Container(
        margin: context.edgeInsets(all: 16),
        height: context.h(180),
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF0D4), Color(0xFFFFDEA4)],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColourPrimary.withValues(alpha: 0.12),
              offset: const Offset(0, 0),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -70,
              child: Container(
                width: 192,
                height: 192,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(45, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: context.edgeInsets(left: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.h(AppSpacing.lg)),
                  Padding(
                    padding: context.edgeInsets(right: AppSpacing.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total Balance",
                          style: AppTextStyles.bodyTextRegular(
                            context,
                          ).copyWith(color: AppColors.secondryColour),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: context.h(AppSpacing.sm)),
                  Text(
                    "\$ ${Formatters.amount(24562.00)}.00",
                    style: AppTextStyles.titleLargeBold(
                      context,
                    ).copyWith(color: Color(0xFF3E2C1C)),
                  ),
                  SizedBox(height: context.h(AppSpacing.sm)),
                  Row(
                    children: [
                      StatChip(
                        icon: Icons.arrow_downward,
                        amount: 3200,
                        iconColour: Color(0xFF22C55E),
                      ),
                      StatChip(
                        icon: Icons.arrow_upward,
                        amount: 3200,
                        iconColour: Color(0xFFEF4444),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
