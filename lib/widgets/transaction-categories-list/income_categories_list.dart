import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/utils/formatter.dart';

class IncomeCategoriesListWidget extends StatefulWidget {
  const IncomeCategoriesListWidget({super.key});

  @override
  State<IncomeCategoriesListWidget> createState() =>
      _IncomeCategoriesListWidgetState();
}

class _IncomeCategoriesListWidgetState
    extends State<IncomeCategoriesListWidget> {
  IncomeCategory? _selectedIncomeCategory;
  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: _selectedIncomeCategory,
      onChanged: (IncomeCategory? value) {
        setState(() {
          _selectedIncomeCategory = value;
        });
      },
      child: Column(
        children: [
          for (final category in IncomeCategory.values)
            InkWell(
              borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.primaryColour.withValues(alpha: 0.2);
                }

                return null;
              }),
              onTap: () {
                setState(() {
                  _selectedIncomeCategory = category;
                });
              },
              child: Container(
                width: double.infinity,
                padding: context.edgeInsets(horizontal: 10, vertical: 10),
                margin: context.edgeInsets(bottom: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: _selectedIncomeCategory == category
                      ? AppColors.primaryColour
                      : AppColors
                            .backgroundCardColour, //change the colour based on if the radio button is selected
                  borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
                ),
                child: Row(
                  children: [
                    incomeCategoryWidget(
                      context: context,
                      incomeCategory: category,
                      height: 44,
                      width: 44,
                    ),
                    SizedBox(width: context.w(AppSpacing.md)),
                    Text(
                      Formatters.capitalize(category.name),
                      style: AppTextStyles.primaryTextSemiBold(context)
                          .copyWith(
                            color: _selectedIncomeCategory == category
                                ? AppColors.backgroundCardColour
                                : AppColors.secondryColour,
                            fontWeight: _selectedIncomeCategory == category
                                ? FontWeight.w900
                                : AppTextStyles.primaryTextSemiBold(
                                    context,
                                  ).fontWeight,
                          ),
                    ),
                    const Spacer(),
                    Radio<IncomeCategory>(
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.backgroundCardColour;
                        }

                        return AppColors.secondryColour;
                      }),
                      value: category,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
