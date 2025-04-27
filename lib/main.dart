import 'package:fibble_app/presentation/pages/accounts/accounts_page.dart';
import 'package:fibble_app/presentation/pages/homes/home_page.dart';
import 'package:fibble_app/presentation/pages/learns/learns_page.dart';
import 'package:fibble_app/presentation/pages/plans/plans_page.dart';
import 'package:fibble_app/presentation/pages/reports/reports_page.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fible App",
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/reports", page: () => const ReportsPage()),
        GetPage(name: "/plans", page: () => const PlansPage()),
        GetPage(name: "/learns", page: () => const LearnsPage()),
        GetPage(name: "/accounts", page: () => const AccountsPage())
      ],
    );
  }
}
