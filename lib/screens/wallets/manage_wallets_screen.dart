import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/db/db_helper.dart';
import 'package:simple_budget_app/db/models/wallet_model.dart';
import 'package:simple_budget_app/screens/wallets/add_wattet_screen.dart';
import 'package:simple_budget_app/screens/wallets/widgets/wallet_balance_card.dart';
import 'package:simple_budget_app/screens/wallets/widgets/wallet_card.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class ManageWalletsScreen extends StatefulWidget {
  const ManageWalletsScreen({super.key});

  @override
  State<ManageWalletsScreen> createState() => _ManageWalletsScreenState();
}

class _ManageWalletsScreenState extends State<ManageWalletsScreen> {
  List<WalletModel> walletModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadWallets();
  }

  void loadWallets() async {
    List<WalletModel> wallets = await DBHelper.getInstance.getWallets();
    setState(() {
      walletModels = wallets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WalletBalanceCard(),
          SizedBox(height: context.h(AppSpacing.md)),
          Padding(
            padding: context.edgeInsets(horizontal: AppSpacing.lg),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Wallets",
                      style: AppTextStyles.bodyTextBold(context),
                    ),
                    Spacer(),

                    Text(
                      "${walletModels.length} wallets",
                      style: AppTextStyles.bodyTextBold(context).copyWith(
                        color: AppColors.secondryColour,
                        fontSize: context.sp(12),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(AppSpacing.lg)),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: context.w(AppSpacing.md), // horizontal gap
                  mainAxisSpacing: context.h(AppSpacing.md),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisExtent: context.h(156),
                  children: [
                    for (WalletModel walletModel in walletModels) ...[
                      WalletCard(
                        walletTitle: walletModel.walletName,
                        balanceText: "\$${walletModel.currentBalance}",
                        walletIcon: walletIconMap[walletModel.walletIcon]!,
                        badgeColor: walletModel.colour,
                      ),
                    ],
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        context.r(AppSpacing.md),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () async {
                          final bool? added = await Navigator.push<bool>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddWattetScreen(),
                            ),
                          );

                          if (added == true) {
                            loadWallets();
                          }
                        },
                        splashColor: AppColors.secondryColour.withValues(
                          alpha: 0.12,
                        ),
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            radius: Radius.circular(context.r(AppSpacing.md)),
                            dashPattern: const [10, 5],
                            strokeWidth: 1.5,
                            padding: EdgeInsets.zero,
                            color: AppColors.textColourSecondry.withValues(
                              alpha: 0.35,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundCardColour.withAlpha(
                                50,
                              ),
                              borderRadius: BorderRadius.circular(
                                context.r(AppSpacing.md),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.add_circle,
                                      color: AppColors.secondryColour,
                                    ),

                                    Text(
                                      'Add wallet',
                                      style: AppTextStyles.bodyTextBold(context)
                                          .copyWith(
                                            fontSize: context.sp(12),
                                            color: AppColors.textColourBody,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(56)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
