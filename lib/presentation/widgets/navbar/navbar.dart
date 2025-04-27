import 'package:fibble_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:fibble_app/presentation/controllers/navbar/navbar_controllers.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.changePage(0);
                  Get.toNamed("/home");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => PhosphorIcon(
                        PhosphorIconsFill.house,
                        size: 29.0,
                        color: controller.currentIndex.value == 0
                            ? whiteColor
                            : blackNavbarColor,
                      ),
                    ),
                    SizedBox(height: 4), // Space between icon and text
                    Obx(
                      () => Text(
                        "Beranda",
                        style: TextStyle(
                          color: controller.currentIndex.value == 0
                              ? whiteColor
                              : blackNavbarColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changePage(1);
                  Get.toNamed("/reports");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => PhosphorIcon(
                        PhosphorIconsFill.chartBar,
                        size: 29.0,
                        color: controller.currentIndex.value == 1
                            ? whiteColor
                            : blackNavbarColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                        "Laporan",
                        style: TextStyle(
                          color: controller.currentIndex.value == 1
                              ? whiteColor
                              : blackNavbarColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changePage(2);
                  Get.toNamed("/plans");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => PhosphorIcon(
                        PhosphorIconsFill.notepad,
                        size: 29.0,
                        color: controller.currentIndex.value == 2
                            ? whiteColor
                            : blackNavbarColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                        "Rencana",
                        style: TextStyle(
                          color: controller.currentIndex.value == 2
                              ? whiteColor
                              : blackNavbarColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changePage(3);
                  Get.toNamed("/learns");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => PhosphorIcon(
                        PhosphorIconsFill.graduationCap,
                        size: 29.0,
                        color: controller.currentIndex.value == 3
                            ? whiteColor
                            : blackNavbarColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                        "Belajar",
                        style: TextStyle(
                          color: controller.currentIndex.value == 3
                              ? whiteColor
                              : blackNavbarColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changePage(4);
                  Get.toNamed("/accounts");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => PhosphorIcon(
                        PhosphorIconsFill.userCircle,
                        size: 29.0,
                        color: controller.currentIndex.value == 4
                            ? whiteColor
                            : blackNavbarColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                        "Akun",
                        style: TextStyle(
                          color: controller.currentIndex.value == 4
                              ? whiteColor
                              : blackNavbarColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
