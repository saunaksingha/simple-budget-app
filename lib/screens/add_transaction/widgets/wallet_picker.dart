import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/db/models/wallet_model.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/utils/formatter.dart';

class WalletPicker extends StatefulWidget {
  const WalletPicker({super.key, required this.wallets});

  final List<WalletModel> wallets;

  @override
  State<WalletPicker> createState() => _WalletPickerState();
}

class _WalletPickerState extends State<WalletPicker> {
  WalletModel? _selectedWallet;

  void onSelectWallet(WalletModel? value) {
    setState(() {
      _selectedWallet = value!;
      Navigator.pop(context, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RadioGroup(
        groupValue: _selectedWallet,
        onChanged: (WalletModel? value) {
          onSelectWallet(value);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (WalletModel wallet in widget.wallets) ...[
              InkWell(
                borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
                overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return AppColors.primaryColour.withValues(alpha: 0.2);
                  }

                  return null;
                }),
                onTap: () {
                  onSelectWallet(wallet);
                },
                child: Container(
                  width: double.infinity,
                  padding: context.edgeInsets(horizontal: 10, vertical: 10),
                  margin: context.edgeInsets(bottom: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: _selectedWallet == wallet
                        ? AppColors.primaryColour
                        : AppColors
                              .backgroundCardColour, //change the colour based on if the radio button is selected
                    borderRadius: BorderRadius.circular(
                      context.r(AppSpacing.md),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: context.h(44),
                        width: context.w(44),
                        decoration: BoxDecoration(
                          color: badgeBackgroundColors[wallet.colour],
                          borderRadius: BorderRadius.circular(
                            context.r(AppSpacing.md),
                          ),
                        ),
                        child: Icon(
                          walletIconMap[wallet.walletIcon],
                          color: badgeIconColors[wallet.colour],
                          size: context.sp(24),
                        ),
                      ),
                      SizedBox(width: context.w(AppSpacing.md)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Formatters.capitalize(wallet.walletName),
                            style: AppTextStyles.primaryTextMedium(
                              context,
                            ).copyWith(color: AppColors.textColourPrimary),
                          ),
                          Text(
                            "\$${wallet.currentBalance}",
                            style: AppTextStyles.bodyTextRegular(context)
                                .copyWith(
                                  color: AppColors.textColourPrimary.withAlpha(
                                    120,
                                  ),
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Radio<WalletModel>(
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.backgroundCardColour;
                          }

                          return AppColors.secondryColour;
                        }),
                        value: wallet,
                      ),
                    ],
                  ),
                ),
              ),
            ],

            SizedBox(height: context.h(AppSpacing.lg)),
          ],
        ),
      ),
    );
  }
}
