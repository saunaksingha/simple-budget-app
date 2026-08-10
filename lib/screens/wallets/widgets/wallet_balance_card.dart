import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: AppColors.backgroundColour,
      child: Container(
        margin: context.edgeInsets(all: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundCardColour,
          borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColourPrimary.withValues(alpha: 0.12),
              offset: const Offset(0, 0),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
            splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
              child: Stack(
                children: [
                  Positioned(
                    top: -80,
                    right: -80,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.primaryColour.withValues(alpha: 0.35),
                            AppColors.primaryColour.withValues(alpha: 0.15),
                            AppColors.primaryColour.withValues(alpha: 0.0),
                          ],
                          stops: const [0.0, 0.45, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Balance",
                          style: AppTextStyles.primaryTextRegular(
                            context,
                          ).copyWith(color: AppColors.textColourBody),
                        ),
                        SizedBox(height: context.h(AppSpacing.sm)),
                        Text(
                          "\$24,452.00",
                          style: AppTextStyles.primaryTextMedium(
                            context,
                          ).copyWith(fontSize: context.sp(32)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
