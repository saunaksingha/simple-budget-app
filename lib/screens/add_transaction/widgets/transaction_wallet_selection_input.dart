import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/db/db_helper.dart';
import 'package:simple_budget_app/db/models/wallet_model.dart';
import 'package:simple_budget_app/screens/add_transaction/widgets/wallet_picker.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';

class TransactionWalletSelectionInput extends StatefulWidget {
  const TransactionWalletSelectionInput({super.key});

  @override
  State<TransactionWalletSelectionInput> createState() =>
      _TransactionWalletSelectionInputState();
}

class _TransactionWalletSelectionInputState
    extends State<TransactionWalletSelectionInput> {
  String title = "Wallet";
  String hintText = "Select a wallet";
  IconData selectionIcon = LucideIcons.wallet;
  Color? selectionIconClour = AppColors.secondryColour;
  Color? selectionIconBackgroundColour = AppColors.backgroundColour;

  List<WalletModel> walletModels = [];

  @override
  void initState() {
    super.initState();
    loadWallets();
  }

  void _showWalletPicker() async {
    WalletModel? selectedWallet = await showModalBottomSheet<WalletModel>(
      context: context,
      backgroundColor: AppColors.backgroundColour,
      builder: (context) => Padding(
        padding: context.edgeInsets(
          horizontal: AppSpacing.md,
          top: AppSpacing.xl,
          bottom: AppSpacing.lg,
        ),
        child: WalletPicker(wallets: walletModels),
      ),
    );

    if (selectedWallet != null) {
      setState(() {
        title = selectedWallet.walletName;
        hintText = '\$${selectedWallet.currentBalance}';
        selectionIcon = walletIconMap[selectedWallet.walletIcon]!;
        selectionIconBackgroundColour =
            badgeBackgroundColors[selectedWallet.colour];
        selectionIconClour = badgeIconColors[selectedWallet.colour]!;
      });
    }
  }

  void loadWallets() async {
    List<WalletModel> wallets = await DBHelper.getInstance.getWallets();
    setState(() {
      walletModels = wallets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundCardColour,
      borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
      child: InkWell(
        splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
        onTap: () {
          _showWalletPicker();
        },
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
