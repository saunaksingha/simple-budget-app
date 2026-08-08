import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class AppSegmentedControl<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onChanged;
  final String Function(T item) labelBuilder;

  const AppSegmentedControl({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(48),
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
      ),
      child: Row(
        children: [
          for (final item in items)
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onChanged(item),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: item == selectedItem
                        ? AppColors.secondryColour
                        : AppColors.surfaceColor,
                    borderRadius: BorderRadius.circular(
                      context.r(AppSpacing.md),
                    ),
                  ),
                  child: Text(
                    labelBuilder(item),
                    style: item == selectedItem
                        ? AppTextStyles.bodyTextBold(
                            context,
                          ).copyWith(color: AppColors.backgroundCardColour)
                        : AppTextStyles.bodyTextBold(
                            context,
                          ).copyWith(color: AppColors.textColourSecondry),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
