import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class AddTransactionScree extends StatelessWidget {
  const AddTransactionScree({super.key});

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
        padding: context.edgeInsets(all: AppSpacing.lg),
        child: Form(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: AppTextStyles.primaryTextSemiBold(context),
                  ),
                  SizedBox(height: context.h(AppSpacing.sm)),
                  Container(
                    padding: context.edgeInsets(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundCardColour,
                      borderRadius: BorderRadius.circular(
                        context.r(AppSpacing.md),
                      ),
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Text(
                          "Enter a title",
                          style: AppTextStyles.primaryTextMedium(context)
                              .copyWith(
                                color: AppColors.secondryColour.withValues(
                                  alpha: 0.40,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
