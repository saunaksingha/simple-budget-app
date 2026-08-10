import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/badges_color.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.onColorSelectCallBack,
    required this.defaultColor,
  });

  final BadgeColor defaultColor;
  final Function(BadgeColor color) onColorSelectCallBack;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late BadgeColor _selectedColour;

  @override
  void initState() {
    super.initState();
    _selectedColour = widget.defaultColor;
  }

  Widget _colorButton(BadgeColor badgeColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColour = badgeColor;
          widget.onColorSelectCallBack(badgeColor);
        });
      },
      child: Container(
        width: context.w(32),
        height: context.h(32),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedColour == badgeColor
                ? badgeIconColors[badgeColor]!
                : AppColors.backgroundCardColour,
            width: context.w(4),
          ),
        ),
        child: Center(
          child: Container(
            width: context.w(24),
            height: context.w(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: badgeBackgroundColors[badgeColor],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Wallet Color", style: AppTextStyles.bodyTextBold(context)),
            SizedBox(height: AppSpacing.sm),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (BadgeColor badgeColor in BadgeColor.values) ...[
                    _colorButton(badgeColor),
                    SizedBox(width: context.w(4)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
