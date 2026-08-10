import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/data/app_icons.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';

class IconPicker extends StatefulWidget {
  const IconPicker({
    super.key,
    required this.defaultIcon,
    required this.onPickedIcon,
  });
  final WalletIcon? defaultIcon;

  final Function(WalletIcon icon) onPickedIcon;
  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  WalletIcon? _pickedIcon;

  @override
  void initState() {
    super.initState();
    _pickedIcon = widget.defaultIcon;
  }

  Widget _iconButton(WalletIcon walletIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pickedIcon = walletIcon;
          widget.onPickedIcon(walletIcon);
          Navigator.pop(context);
        });
      },

      child: Container(
        padding: context.edgeInsets(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: _pickedIcon == walletIcon
              ? AppColors.primaryColour
              : AppColors.backgroundCardColour,
          borderRadius: BorderRadius.circular(context.r(AppSpacing.md)),
        ),
        child: Center(child: Icon(walletIconMap[walletIcon])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.lg,
      ),
      child: GridView.count(
        crossAxisSpacing: context.w(AppSpacing.md),
        mainAxisSpacing: context.h(AppSpacing.md),
        crossAxisCount: 3,
        children: [
          for (WalletIcon walletIcon in walletIconMap.keys) ...[
            _iconButton(walletIcon),
          ],
        ],
      ),
    );
  }
}

//  GestureDetector(
//
//       child: Container(
//         width: context.w(32),
//         height: context.h(32),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: _selectedColour == badgeColor
//                 ? badgeIconColors[badgeColor]!
//                 : AppColors.backgroundCardColour,
//             width: context.w(4),
//           ),
//         ),
//         child: Center(
//           child: Container(
//             width: context.w(24),
//             height: context.w(24),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: badgeBackgroundColors[badgeColor],
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.08),
//                   blurRadius: 4,
//                   offset: const Offset(0, 1),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
