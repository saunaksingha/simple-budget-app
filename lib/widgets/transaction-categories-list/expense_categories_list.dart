import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/utils/formatter.dart';

class ExpenseCategoriesListWidget extends StatefulWidget {
  const ExpenseCategoriesListWidget({super.key});

  @override
  State<ExpenseCategoriesListWidget> createState() =>
      _ExpenseCategoriesListWidgetState();
}

class _ExpenseCategoriesListWidgetState
    extends State<ExpenseCategoriesListWidget> {
  ExpenseCategory? _selectedExpenseCategory;

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: _selectedExpenseCategory,
      onChanged: (ExpenseCategory? value) {
        setState(() {
          _selectedExpenseCategory = value;
        });
      },
      child: Column(
        children: [
          for (final category in ExpenseCategory.values)
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
                  _selectedExpenseCategory = category;
                });
              },
              child: Container(
                width: double.infinity,
                padding: context.edgeInsets(horizontal: 10, vertical: 10),
                margin: context.edgeInsets(bottom: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: _selectedExpenseCategory == category
                      ? AppColors.primaryColour
                      : AppColors
                            .backgroundCardColour, //change the colour based on if the radio button is selected
                  borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
                ),
                child: Row(
                  children: [
                    expenseCategoryWidget(
                      context: context,
                      expenseCategory: category,
                      height: 44,
                      width: 44,
                    ),
                    SizedBox(width: context.w(AppSpacing.md)),
                    Text(
                      Formatters.capitalize(category.name),
                      style: AppTextStyles.primaryTextSemiBold(
                        context,
                      ).copyWith(color: AppColors.secondryColour),
                    ),
                    const Spacer(),
                    Radio<ExpenseCategory>(
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.secondryColour;
                        }

                        return AppColors.textColourSecondry;
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
