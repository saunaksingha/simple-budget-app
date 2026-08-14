import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/categories.dart';
import 'package:simple_budget_app/provider/transactions_type_provider.dart';
import 'package:simple_budget_app/screens/add_transaction/widgets/transaction_category_selection_input.dart';
import 'package:simple_budget_app/screens/add_transaction/widgets/transaction_inputfield.dart';
import 'package:simple_budget_app/screens/add_transaction/widgets/transaction_memo_inputfield.dart';
import 'package:simple_budget_app/screens/add_transaction/widgets/transaction_selection_input.dart';
import 'package:simple_budget_app/screens/select_transaction_category.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/utils/formatter.dart';
import 'package:simple_budget_app/widgets/app_segmented_control.dart';

class AddTransactionScree extends ConsumerStatefulWidget {
  const AddTransactionScree({super.key}) : category = ExpenseCategory.bills;

  final ExpenseCategory category;

  @override
  ConsumerState<AddTransactionScree> createState() =>
      _AddTransactionScreeState();
}

class _AddTransactionScreeState extends ConsumerState<AddTransactionScree> {
  TransactionType _selectedTransactionCategory = TransactionType.expense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        title: Text(
          "Transaction",
          style: AppTextStyles.primaryTextBold(
            context,
          ).copyWith(color: AppColors.secondryColour),
        ),
      ),
      body: Padding(
        padding: context.edgeInsets(horizontal: AppSpacing.lg),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                AppSegmentedControl(
                  items: TransactionType.values,
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
                  colors: [Colors.red, Colors.green, Colors.blueGrey],
                ),
                SizedBox(height: context.h(AppSpacing.lg)),

                TransactionInputfield(
                  inputTitle: "Amount",
                  hintText: "0.00",
                  inputFieldIcon: Icons.currency_rupee,
                  holdFocus: true,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onValidDataInput: (inputData) {},
                ),
                SizedBox(height: context.h(AppSpacing.md)),

                TransactionInputfield(
                  inputTitle: "Title",
                  hintText: "Short title",
                  holdFocus: true,
                  inputFieldIcon: Icons.mode_edit_outline_outlined,
                  keyboardType: TextInputType.text,
                  onValidDataInput: (inputData) {},
                ),
                SizedBox(height: context.h(AppSpacing.md)),

                TransactionCategorySelectionInput(
                  onCategorySelect: () {
                    setState(() {
                      _selectedTransactionCategory = ref.watch(
                        transactionTypeProvider,
                      );
                    });
                  },
                ),
                SizedBox(height: context.h(AppSpacing.md)),

                TransactionSelectionInput(
                  selectionTitle: "Category",
                  hintText: "Select a category",
                  selectionIcon: Icon(Icons.grid_view_outlined),

                  onClick: () async {
                    final Map<TransactionType, dynamic>?
                    transactionCategoryDetails =
                        await Navigator.push<Map<TransactionType, dynamic>>(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => SelectTransactionCategory(
                              defaultTransactionType:
                                  _selectedTransactionCategory,
                            ),
                          ),
                        );

                    if (transactionCategoryDetails != null) {
                      final entry = transactionCategoryDetails.entries.first;
                      _selectedTransactionCategory = entry.key;

                      if (entry.key == TransactionType.expense) {
                      } else if (entry.key == TransactionType.income) {
                      } else {}
                    }
                  },
                ),

                SizedBox(height: context.h(AppSpacing.md)),
                // TransactionSelectionInput(
                //   selectionTitle: "Wallet",
                //   hintText: "Select a wallet",
                //   selectionIcon: Icon(Icons.account_balance_wallet_outlined),
                //   onClick: () {},
                // ),
                SizedBox(height: context.h(AppSpacing.md)),
                TransactionMemoInputField(
                  inputTitle: "Memo",
                  holdFocus: true,
                  hintText: "Enter a memo",
                  inputFieldIcon: Icon(Icons.edit_note),
                ),

                SizedBox(height: context.h(AppSpacing.md)),
                Row(
                  children: [
                    // DATE
                    Expanded(
                      child: Container(
                        padding: context.edgeInsets(
                          left: 8,
                          right: 4,
                          vertical: AppSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundCardColour,
                          borderRadius: BorderRadius.circular(
                            context.r(AppSpacing.md),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textColourPrimary.withValues(
                                alpha: 0.05,
                              ),
                              offset: const Offset(0, 0),
                              blurRadius: context.r(8),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: context.h(40),
                              width: context.w(40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  context.sp(AppSpacing.sm),
                                ),
                                color: AppColors.surfaceColor,
                              ),
                              child: const Icon(Icons.calendar_month_outlined),
                            ),

                            SizedBox(width: context.w(10)),

                            // IMPORTANT: gives the text only the space available
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Date",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextBold(
                                      context,
                                    ).copyWith(fontSize: context.sp(12)),
                                  ),
                                  Text(
                                    "9th Aug 2026",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextRegular(
                                      context,
                                    ).copyWith(fontSize: context.sp(12)),
                                  ),
                                ],
                              ),
                            ),

                            // Small arrow instead of IconButton
                            const Icon(Icons.chevron_right, size: 26),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: context.w(AppSpacing.sm)),

                    // TIME
                    Expanded(
                      child: Container(
                        padding: context.edgeInsets(
                          left: 8,
                          right: 4,
                          vertical: AppSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundCardColour,
                          borderRadius: BorderRadius.circular(
                            context.r(AppSpacing.md),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textColourPrimary.withValues(
                                alpha: 0.05,
                              ),
                              offset: const Offset(0, 0),
                              blurRadius: context.r(8),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: context.h(40),
                              width: context.w(40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  context.sp(AppSpacing.sm),
                                ),
                                color: AppColors.surfaceColor,
                              ),
                              child: const Icon(Icons.access_time_outlined),
                            ),

                            SizedBox(width: context.w(10)),

                            // IMPORTANT
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Time",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextBold(
                                      context,
                                    ).copyWith(fontSize: context.sp(12)),
                                  ),
                                  Text(
                                    "11:00 AM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextRegular(
                                      context,
                                    ).copyWith(fontSize: context.sp(12)),
                                  ),
                                ],
                              ),
                            ),

                            const Icon(Icons.chevron_right, size: 26),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(AppSpacing.lg)),
                Container(
                  alignment: Alignment.center,
                  padding: context.edgeInsets(vertical: AppSpacing.md),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColour,
                    borderRadius: BorderRadius.circular(
                      context.r(AppSpacing.lg),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: AppTextStyles.primaryTextBold(
                      context,
                    ).copyWith(color: AppColors.textColourPrimary),
                  ),
                ),
                SizedBox(height: context.h(80)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
