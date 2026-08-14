import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/provider/transactions_type_provider.dart';
import 'package:simple_budget_app/screens/select_transaction_category.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/utils/formatter.dart';

class TransactionCategorySelectionInput extends ConsumerStatefulWidget {
  const TransactionCategorySelectionInput({
    super.key,
    required this.onCategorySelect,
  });
  final Function() onCategorySelect;
  @override
  ConsumerState<TransactionCategorySelectionInput> createState() =>
      _TransactionCategorySelectionInputState();
}

class _TransactionCategorySelectionInputState
    extends ConsumerState<TransactionCategorySelectionInput> {
  String title = "Category";
  String hintText = "Select a category";
  IconData selectionIcon = Icons.grid_view_outlined;
  Color? selectionIconClour = AppColors.secondryColour;
  Color? selectionIconBackgroundColour = AppColors.backgroundColour;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundCardColour,
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
      child: InkWell(
        splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
        onTap: () async {
          final Map<TransactionType, dynamic>? transactionCategoryDetails =
              await Navigator.push<Map<TransactionType, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (contex) => SelectTransactionCategory(
                    defaultTransactionType: ref.watch(transactionTypeProvider),
                  ),
                ),
              );

          if (transactionCategoryDetails != null) {
            final entry = transactionCategoryDetails.entries.first;

            if (entry.key == TransactionType.expense) {
              final expenseCategory = entry.value as ExpenseCategory;

              setState(() {
                title = Formatters.capitalize(expenseCategory.name);
                hintText = "";
                selectionIcon = expenseCategoryIcons[expenseCategory]!;
                selectionIconClour =
                    expenseCategoryIconColors[expenseCategory]!;
                selectionIconBackgroundColour =
                    expenseCategoryBackgroundColors[expenseCategory]!;
              });
            } else {
              final incomeCategory = entry.value as IncomeCategory;

              setState(() {
                title = Formatters.capitalize(incomeCategory.name);
                hintText = "";
                selectionIcon = incomeCategoryIcons[incomeCategory]!;
                selectionIconClour = incomeCategoryIconColors[incomeCategory]!;
                selectionIconBackgroundColour =
                    incomeCategoryBackgroundColors[incomeCategory]!;
              });
            }
            widget.onCategorySelect();
          }
        },
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
                    color: selectionIconBackgroundColour,
                  ),
                  child: Icon(selectionIcon, color: selectionIconClour),
                ),
                SizedBox(width: context.w(10)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.bodyTextBold(
                          context,
                        ).copyWith(color: AppColors.textColourPrimary),
                      ),

                      if (hintText.isNotEmpty)
                        Text(
                          hintText,
                          style: AppTextStyles.bodyTextRegular(context)
                              .copyWith(
                                color: AppColors.textColourPrimary.withAlpha(
                                  120,
                                ),
                              ),
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
