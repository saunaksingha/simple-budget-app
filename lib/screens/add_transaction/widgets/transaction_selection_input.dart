import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class TransactionSelectionInput extends StatelessWidget {
  const TransactionSelectionInput({
    super.key,
    required this.selectionTitle,
    required this.hintText,
    required this.selectionIcon,
  });
  final String selectionTitle;
  final String hintText;
  final Icon selectionIcon;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundCardColour,
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
      child: InkWell(
        splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
        onTap: () {},
        borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
        child: Container(
          width: double.infinity,
          padding: context.edgeInsets(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
          ),
          child: Padding(
            padding: context.edgeInsets(vertical: AppSpacing.sm),
            child: Row(
              children: [
                Container(
                  height: context.h(40),
                  width: context.w(40),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.sp(AppSpacing.sm),
                    ),
                    color: AppColors.backgroundColour,
                  ),
                  child: selectionIcon,
                ),
                SizedBox(width: context.w(10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectionTitle,
                        style: AppTextStyles.bodyTextBold(
                          context,
                        ).copyWith(color: AppColors.textColourPrimary),
                      ),
                      Text(
                        hintText,
                        style: AppTextStyles.bodyTextRegular(context),
                      ),
                    ],
                  ),
                ),

                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
