import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/provider/transactions_type_provider.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/utils/formatter.dart';
import 'package:simple_budget_app/widgets/app_segmented_control.dart';
import 'package:simple_budget_app/widgets/transaction-categories-list/expense_categories_list.dart';
import 'package:simple_budget_app/widgets/transaction-categories-list/income_categories_list.dart';

class SelectTransactionCategory extends ConsumerStatefulWidget {
  const SelectTransactionCategory({
    super.key,
    required this.defaultTransactionType,
  });

  final TransactionType defaultTransactionType;

  @override
  ConsumerState<SelectTransactionCategory> createState() =>
      _SelectTransactionCategoryState();
}

class _SelectTransactionCategoryState
    extends ConsumerState<SelectTransactionCategory> {
  late TransactionType _selectedTransactionCategory;

  @override
  void initState() {
    super.initState();
    _selectedTransactionCategory = widget.defaultTransactionType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        title: Text(
          "Category",
          style: AppTextStyles.primaryTextBold(
            context,
          ).copyWith(color: AppColors.secondryColour),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.edgeInsets(
            horizontal: AppSpacing.md,
            top: AppSpacing.sm,
            bottom: AppSpacing.xxxl,
          ),
          child: Column(
            children: [
              AppSegmentedControl<TransactionType>(
                items: const [TransactionType.expense, TransactionType.income],
                selectedItem: _selectedTransactionCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedTransactionCategory = value;
                    ref
                        .read(transactionTypeProvider.notifier)
                        .toggleTransactionType(value);
                  });
                },
                labelBuilder: (item) => Formatters.capitalize(item.name),
              ),
              SizedBox(height: context.h(AppSpacing.md)),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOutQuint,
                child: _selectedTransactionCategory == TransactionType.income
                    ? IncomeCategoriesListWidget(
                        onSelectIncome: (incomeCategory) {
                          Navigator.pop(context, {
                            TransactionType.income: incomeCategory,
                          });
                        },
                      )
                    : ExpenseCategoriesListWidget(
                        onSelectExpense: (expenseCategory) {
                          Navigator.pop(context, {
                            TransactionType.expense: expenseCategory,
                          });
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
