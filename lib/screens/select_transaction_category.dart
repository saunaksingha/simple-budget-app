import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/utils/formatter.dart';
import 'package:simple_budget_app/widgets/app_segmented_control.dart';
import 'package:simple_budget_app/widgets/transaction-categories-list/expense_categories_list.dart';
import 'package:simple_budget_app/widgets/transaction-categories-list/income_categories_list.dart';

class SelectTransactionCategory extends StatefulWidget {
  const SelectTransactionCategory({super.key});

  @override
  State<SelectTransactionCategory> createState() =>
      _SelectTransactionCategoryState();
}

class _SelectTransactionCategoryState extends State<SelectTransactionCategory> {
  TransactionCategory _selectedTransactionCategory = TransactionCategory.income;

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
              AppSegmentedControl<TransactionCategory>(
                items: const [
                  TransactionCategory.expense,
                  TransactionCategory.income,
                ],
                selectedItem: _selectedTransactionCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedTransactionCategory = value;
                  });
                },
                labelBuilder: (item) => Formatters.capitalize(item.name),
              ),
              SizedBox(height: context.h(AppSpacing.md)),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOutQuint,
                child:
                    _selectedTransactionCategory == TransactionCategory.income
                    ? IncomeCategoriesListWidget()
                    : ExpenseCategoriesListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
