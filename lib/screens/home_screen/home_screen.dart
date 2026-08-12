import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:simple_budget_app/screens/home_screen/widgets/transaction_card.dart';
import 'package:simple_budget_app/screens/home_screen/widgets/transaction_list.dart';
import 'package:simple_budget_app/themes/app_spacing.dart';
import 'package:simple_budget_app/themes/app_text_styles.dart';
import 'package:simple_budget_app/themes/app_colors.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:simple_budget_app/widgets/chips/stat_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColour,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCardColour,

        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        title: Text(
          "Home",
          style: AppTextStyles.primaryTextBold(
            context,
          ).copyWith(color: AppColors.secondryColour),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 112,
            decoration: BoxDecoration(
              color: AppColors.backgroundCardColour,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.r(AppSpacing.xxl)),
                bottomRight: Radius.circular(context.r(AppSpacing.xxl)),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColourPrimary.withValues(alpha: 0.08),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "TOTAL",
                  style: AppTextStyles.smallTextSemiBold(
                    context,
                  ).copyWith(color: AppColors.secondryColour),
                ),
                Text(
                  "\$ 12,000,00",
                  style: AppTextStyles.primaryTextBold(context).copyWith(
                    fontSize: context.sp(24),
                    color: AppColors.textColourPrimary,
                  ),
                ),
                SizedBox(height: context.h(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatChip(
                      icon: Icons.arrow_downward,
                      amount: 3200,
                      iconColour: Color(0xFF22C55E),
                    ),
                    StatChip(
                      icon: Icons.arrow_upward,
                      amount: 3200,
                      iconColour: Color(0xFFEF4444),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: context.h(AppSpacing.md)),
          TransactionList(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: context.edgeInsets(top: 16, bottom: 8, horizontal: 16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: context.sp(12),
                spreadRadius: 0,
                offset: const Offset(0, -3),
              ),
            ],
            color: AppColors.backgroundColour,
            border: Border(
              top: BorderSide(
                color: AppColors.secondryColour.withValues(alpha: 0.12),
                width: 1,
              ),
            ),
          ),
          child: GNav(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            tabBackgroundColor: AppColors.primaryColour,
            gap: 8,
            tabs: [
              GButton(icon: LucideIcons.home, iconSize: context.sp(24)),
              GButton(icon: LucideIcons.chartPie, iconSize: context.sp(24)),
              GButton(icon: LucideIcons.flag, iconSize: context.sp(24)),
              GButton(icon: LucideIcons.wallet, iconSize: context.sp(24)),
            ],
          ),
        ),
      ),
    );
  }
}
