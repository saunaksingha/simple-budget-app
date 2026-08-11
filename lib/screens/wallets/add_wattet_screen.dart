import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:simple_budget_app/core/validator.dart';
import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/db/db_helper.dart';
import 'package:simple_budget_app/screens/add_transaction/widgets/transaction_inputfield.dart';
import 'package:simple_budget_app/screens/wallets/widgets/icon_picker.dart';
import 'package:simple_budget_app/widgets/color_picker.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AddWattetScreen extends StatefulWidget {
  const AddWattetScreen({super.key});

  @override
  State<AddWattetScreen> createState() => _AddWattetScreenState();
}

class _AddWattetScreenState extends State<AddWattetScreen> {
  WalletIcon _pickedIcon = WalletIcon.purse;
  BadgeColor _pickedColour = BadgeColor.sage;

  bool canSave = false;
  String? _walletTitle;
  double? _inititalWalletBalance;

  void _onDataReceived() {
    if (_inititalWalletBalance != null && _walletTitle != null) {
      setState(() {
        canSave = true;
      });
    } else {
      setState(() {
        canSave = false;
      });
    }
  }

  void _iconPicker() {
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColour,
      context: context,
      builder: (ctx) {
        return IconPicker(
          defaultIcon: _pickedIcon,
          onPickedIcon: (walletIcon) {
            setState(() {
              _pickedIcon = walletIcon;
            });
          },
        );
      },
    );
  }

  bool _excludeBalance = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        title: Text(
          "New wallet",
          style: AppTextStyles.primaryTextBold(
            context,
          ).copyWith(color: AppColors.secondryColour),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),

      body: Padding(
        padding: context.edgeInsets(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: context.h(48)),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: context.edgeInsets(all: 32),
                    decoration: BoxDecoration(
                      color: badgeBackgroundColors[_pickedColour],
                      borderRadius: BorderRadius.circular(
                        context.r(AppSpacing.lg),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      walletIconMap[_pickedIcon],
                      size: context.sp(56),
                      color: badgeIconColors[_pickedColour],
                    ),
                  ),
                  Positioned(
                    right: context.w(-8),
                    bottom: context.h(-8),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundCardColour,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            _iconPicker();
                          },
                          child: Padding(
                            padding: context.edgeInsets(all: AppSpacing.sm),
                            child: Icon(
                              Icons.edit,
                              color: AppColors.secondryColour,
                              size: context.sp(24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.lg),
              TransactionInputfield(
                inputTitle: "Title",
                hintText: "Enter wallet name",
                inputFieldIcon: LucideIcons.pencil,
                holdFocus: true,
                inputValidationType: InputValidationType.title,
                onValidDataInput: (inputData) {
                  if (inputData == null) {
                    _walletTitle = null;
                    _onDataReceived();
                    return;
                  }

                  _walletTitle = inputData;
                  _onDataReceived();
                },
              ),
              SizedBox(height: AppSpacing.md),
              TransactionInputfield(
                inputTitle: "Amount",
                hintText: "Initial balance",
                inputFieldIcon: LucideIcons.banknoteArrowUp,
                inputValidationType: InputValidationType.positiveAmount,
                holdFocus: true,
                onValidDataInput: (inputData) {
                  if (inputData == null) {
                    _inititalWalletBalance = null;
                    _onDataReceived();
                    return;
                  }
                  _inititalWalletBalance = double.tryParse(inputData);
                  _onDataReceived();
                },
              ),
              SizedBox(height: AppSpacing.md),
              ColorPicker(
                defaultColor: _pickedColour,
                onColorSelectCallBack: (pickedColor) {
                  setState(() {
                    _pickedColour = pickedColor;
                  });
                },
              ),
              SizedBox(height: AppSpacing.md),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundCardColour,
                  borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
                ),
                width: double.infinity,
                child: Padding(
                  padding: context.edgeInsets(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
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
                          color: AppColors.secondryColour,
                        ),
                        child: Icon(
                          LucideIcons.squaresExclude,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: context.w(AppSpacing.sm)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exclude",
                            style: AppTextStyles.bodyTextBold(context),
                          ),
                          Text(
                            "Exclude from total balance",
                            style: AppTextStyles.smallTextSemiBold(context)
                                .copyWith(
                                  color: AppColors.textColourBody.withAlpha(
                                    160,
                                  ),
                                ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 0.80,
                        child: Switch(
                          value: _excludeBalance,
                          onChanged: (value) {
                            setState(() {
                              _excludeBalance = value;
                            });
                          },
                          activeThumbColor: Colors.white,
                          activeTrackColor: AppColors.primaryColour,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade200,
                          trackOutlineColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              InkWell(
                borderRadius: BorderRadius.circular(context.r(AppSpacing.lg)),
                splashColor: AppColors.secondryColour.withValues(alpha: 0.12),
                onTap: () async {
                  if (canSave == false) {
                    return;
                  }
                  final success = await DBHelper.getInstance.addWallet(
                    walletName: _walletTitle!,
                    startingBalance: _inititalWalletBalance!,
                    creationDateTime: DateTime.now().toIso8601String(),
                    walletColour: _pickedColour,
                    walletIcon: _pickedIcon,
                    excludeBalance: _excludeBalance,
                  );

                  if (success) {
                    Navigator.pop(context, true);
                  }
                },

                child: Ink(
                  padding: context.edgeInsets(vertical: AppSpacing.md),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: canSave
                        ? AppColors.primaryColour
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(
                      context.r(AppSpacing.lg),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: AppTextStyles.primaryTextBold(
                        context,
                      ).copyWith(color: AppColors.textColourPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
