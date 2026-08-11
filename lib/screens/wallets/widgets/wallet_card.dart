import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.walletTitle,
    required this.balanceText,
    required this.walletIcon,
    required this.badgeColor,
  });

  final String walletTitle;
  final String balanceText;
  final IconData walletIcon;
  final BadgeColor badgeColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.backgroundCardColour,
            borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: context.h(40),
                    width: context.w(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.sp(AppSpacing.sm),
                      ),
                      color: badgeBackgroundColors[badgeColor],
                    ),
                    child: Icon(walletIcon, color: badgeIconColors[badgeColor]),
                  ),

                  SizedBox(height: context.h(4)),

                  Text(
                    walletTitle,
                    style: AppTextStyles.bodyTextBold(context).copyWith(
                      fontSize: context.sp(12),
                      color: AppColors.textColourBody,
                    ),
                  ),

                  SizedBox(height: context.h(4)),

                  Text(
                    balanceText,
                    style: AppTextStyles.primaryTextSemiBold(
                      context,
                    ).copyWith(color: Colors.green),
                  ),
                ],
              ),

              Positioned(
                top: 0,
                right: -4,
                child: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: context.sp(20),
                    color: AppColors.textColourSecondry.withAlpha(120),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
