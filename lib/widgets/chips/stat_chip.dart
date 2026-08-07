import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/themes/add_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/utils/formatter.dart';

class StatChip extends StatefulWidget {
  const StatChip({
    super.key,
    required this.icon,
    required this.amount,
    required this.iconColour,
  });
  final IconData icon;
  final int amount;
  final Color iconColour;
  @override
  State<StatChip> createState() => _StatChipState();
}

class _StatChipState extends State<StatChip> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.backgroundCardColour.withValues(alpha: 0.4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.r(AppSpacing.lg)),
        ),
        child: Padding(
          padding: context.edgeInsets(
            left: context.w(8),
            right: context.w(14),
            vertical: 6,
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: widget.iconColour, size: context.w(20)),
              SizedBox(width: context.w(2)),
              Text(
                "\$${Formatters.amount(widget.amount)}",
                style: AppTextStyles.smallTextSemiBold(
                  context,
                ).copyWith(color: AppColors.secondryColour),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
