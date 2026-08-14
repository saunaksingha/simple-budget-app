import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:simple_budget_app/screens/screen_widgets.dart';
import 'package:simple_budget_app/screens/home_screen/home_screen.dart';
import 'package:simple_budget_app/screens/statistics_screen/statistics_screen.dart';
import 'package:simple_budget_app/screens/targets_screen/targets_screen.dart';
import 'package:simple_budget_app/screens/wallets/manage_wallets_screen.dart';
import 'package:simple_budget_app/themes/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StatisticsScreen(),
    TargetsScreen(),
    ManageWalletsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColour,
      appBar: ScreenWidgets.home(context, _currentIndex),
      body: _screens[_currentIndex],
      floatingActionButton: ScreenWidgets.floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
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
