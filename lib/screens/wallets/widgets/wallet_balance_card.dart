import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class WalletBalanceCard extends StatefulWidget {
  const WalletBalanceCard({super.key});

  @override
  State<WalletBalanceCard> createState() => _WalletBalanceCardState();
}

class _WalletBalanceCardState extends State<WalletBalanceCard> {
  bool isPositive = true;

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
              child: Padding(
                padding: context.edgeInsets(vertical: 20, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total Balance",
                                style: AppTextStyles.smallTextSemiBold(
                                  context,
                                ).copyWith(color: AppColors.textColourBody),
                              ),
                              SizedBox(width: context.w(AppSpacing.sm)),
                              Container(
                                padding: context.edgeInsets(
                                  left: 8,
                                  right: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundColour,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet_outlined,
                                      size: context.sp(14),
                                      color: AppColors.secondryColour,
                                    ),
                                    Text(
                                      'USD',
                                      style:
                                          AppTextStyles.smallTextSemiBold(
                                            context,
                                          ).copyWith(
                                            color: AppColors.secondryColour,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: context.h(4)),
                          Text(
                            '\$3,2054',
                            style: AppTextStyles.primaryTextMedium(
                              context,
                            ).copyWith(fontSize: context.sp(22)),
                          ),
                          SizedBox(height: context.h(4)),

                          Row(
                            children: [
                              Container(
                                width: context.w(20),
                                height: context.h(20),
                                decoration: BoxDecoration(
                                  color: isPositive
                                      ? const Color(0xFFEAF7E9)
                                      : const Color(0xFFFFEEEE),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isPositive
                                      ? Icons.arrow_upward_rounded
                                      : Icons.arrow_downward_rounded,
                                  size: context.sp(14),
                                  color: isPositive
                                      ? const Color(0xFF3BA64A)
                                      : const Color(0xFFE05252),
                                ),
                              ),

                              SizedBox(width: context.w(4)),

                              Text(
                                '${17}%',
                                style: AppTextStyles.smallTextSemiBold(
                                  context,
                                ).copyWith(color: const Color(0xFF3BA64A)),
                              ),

                              SizedBox(width: context.w(4)),

                              Text(
                                'vs last month',
                                style: AppTextStyles.smallTextRegular(context)
                                    .copyWith(
                                      color: AppColors.textColourSecondry
                                          .withAlpha(120),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: context.w(1.2),
                      height: context.h(64),
                      color: AppColors.surfaceColor,
                    ),
                    SizedBox(width: AppSpacing.md),
                    Container(
                      width: context.w(54),
                      height: context.h(54),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surfaceColor,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Small decorative circles
                          Positioned(
                            top: context.h(2),
                            right: context.w(4),
                            child: Icon(
                              Icons.auto_awesome,
                              size: context.sp(18),
                              color: AppColors.primaryColour,
                            ),
                          ),

                          Positioned(
                            bottom: context.h(1),
                            left: context.w(4),
                            child: Icon(
                              Icons.auto_awesome,
                              size: context.sp(16),
                              color: AppColors.primaryColour,
                            ),
                          ),

                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: context.sp(24),
                            color: const Color(0xFFB18A5B),
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
      ),
    );
  }
}
