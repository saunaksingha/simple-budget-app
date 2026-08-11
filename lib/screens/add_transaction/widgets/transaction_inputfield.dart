import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/core/validator.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class TransactionInputfield extends StatefulWidget {
  const TransactionInputfield({
    super.key,
    required this.inputTitle,
    required this.hintText,
    required this.inputFieldIcon,
    required this.onValidDataInput,
    this.keyboardType,
    this.holdFocus,
    this.backgroundColor,
    this.iconColor,
    this.inputValidationType,
  });

  final String inputTitle;
  final String hintText;
  final IconData inputFieldIcon;
  final TextInputType? keyboardType;
  final bool? holdFocus;
  final Color? backgroundColor;
  final Color? iconColor;
  final InputValidationType? inputValidationType;
  final Function(String? inputData) onValidDataInput;

  @override
  State<TransactionInputfield> createState() => _TransactionInputfieldState();
}

class _TransactionInputfieldState extends State<TransactionInputfield> {
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
        splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
        onTap: () {
          setState(() {
            _ignoreTextFieldTap = false;
          });

          FocusScope.of(context).requestFocus(inputFieldFocusNode);
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
                    color: widget.backgroundColor ?? AppColors.surfaceColor,
                  ),
                  child: Icon(
                    widget.inputFieldIcon,
                    color: widget.iconColor ?? AppColors.secondryColour,
                  ),
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
                          onChanged: (value) {
                            if (widget.inputValidationType != null) {
                              ValidationResult validationResult =
                                  Validator.validateData(
                                    validationType: widget.inputValidationType!,
                                    stringToBeValidated: value,
                                  );

                              if (validationResult.status ==
                                  ValidationStatus.success) {
                                widget.onValidDataInput(value);
                              } else {
                                widget.onValidDataInput(null);
                              }
                            } else {
                              widget.onValidDataInput(value);
                            }
                          },
                          onTapOutside: (_) {
                            if (widget.holdFocus == null ||
                                widget.holdFocus == false) {
                              inputFieldFocusNode.unfocus();
                            }
                          },
                          focusNode: inputFieldFocusNode,
                          style: AppTextStyles.bodyTextRegular(
                            context,
                          ).copyWith(color: AppColors.textColourPrimary),
                          cursorColor: AppColors.textColourBody,
                          keyboardType:
                              widget.keyboardType ?? TextInputType.text,

                          decoration: InputDecoration(
                            hintText: widget.hintText,
                            hintStyle: AppTextStyles.bodyTextRegular(context)
                                .copyWith(
                                  color: AppColors.textColourPrimary.withAlpha(
                                    120,
                                  ),
                                ),
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

                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
