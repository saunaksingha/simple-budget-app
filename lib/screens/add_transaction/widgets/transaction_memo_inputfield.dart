import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class TransactionMemoInputField extends StatefulWidget {
  const TransactionMemoInputField({
    super.key,
    required this.inputTitle,
    required this.hintText,
    required this.inputFieldIcon,
    this.holdFocus,
  });

  final String inputTitle;
  final String hintText;
  final Icon inputFieldIcon;
  final bool? holdFocus;

  @override
  State<TransactionMemoInputField> createState() =>
      _TransactionMemoInputFieldState();
}

class _TransactionMemoInputFieldState extends State<TransactionMemoInputField> {
  final inputFieldFocusNode = FocusNode();
  bool _ignoreTextFieldTap = true;

  @override
  void dispose() {
    inputFieldFocusNode.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundCardColour,
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
      child: InkWell(
        onTap: () {
          setState(() {
            _ignoreTextFieldTap = false;
          });

          FocusScope.of(context).requestFocus(inputFieldFocusNode);
        },
        borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
        splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
        child: Padding(
          padding: context.edgeInsets(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: widget.inputFieldIcon,
              ),

              SizedBox(width: context.w(10)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.inputTitle,
                      style: AppTextStyles.bodyTextBold(
                        context,
                      ).copyWith(color: AppColors.textColourPrimary),
                    ),

                    IgnorePointer(
                      ignoring: _ignoreTextFieldTap,
                      child: TextFormField(
                        onTapOutside: (_) {
                          if (widget.holdFocus == null ||
                              widget.holdFocus == false) {
                            inputFieldFocusNode.unfocus();
                          }
                        },
                        focusNode: inputFieldFocusNode,
                        style: AppTextStyles.bodyTextRegular(context),
                        cursorColor: AppColors.textColourBody,

                        keyboardType: TextInputType.multiline,

                        minLines: 3,
                        maxLines: null,

                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          hintStyle: AppTextStyles.bodyTextRegular(context),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
