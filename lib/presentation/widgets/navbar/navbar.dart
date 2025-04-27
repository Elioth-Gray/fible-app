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
              IconButton(
                onPressed: () {
                  controller.changePage(0);
                  Get.toNamed("/home");
                },
                icon: Obx(
                  () => PhosphorIcon(
                      PhosphorIconsFill.house,
                      size: 29.0,
                      color: controller.currentIndex.value == 0
                          ? whiteColor
                          : blackNavbarColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.changePage(1);
                  Get.toNamed("/reports");
                },
                icon: Obx(() => PhosphorIcon(
                      PhosphorIconsFill.tree,
                      size: 29.0,
                      color: controller.currentIndex.value == 1
                          ? whiteColor
                          : blackNavbarColor,
                    )),
              ),
              IconButton(
                onPressed: () {
                  controller.changePage(2);
                  Get.toNamed("/plans");
                },
                icon: Obx(() => PhosphorIcon(
                      controller.currentIndex.value == 2
                          ? PhosphorIconsFill.articleMedium
                          : PhosphorIconsRegular.articleMedium,
                      size: 29.0,
                      color: controller.currentIndex.value == 2
                          ? whiteColor
                          : blackNavbarColor,
                    )),
              ),
              IconButton(
                onPressed: () {
                  controller.changePage(3);
                  Get.toNamed("/learns");
                },
                icon: Obx(() => PhosphorIcon(
                      controller.currentIndex.value == 3
                          ? PhosphorIconsFill.microphoneStage
                          : PhosphorIconsRegular.microphoneStage,
                      size: 29.0,
                      color: Colors.white,
                    )),
              ),
              IconButton(
                onPressed: () {
                  controller.changePage(4);
                  Get.toNamed("/accounts");
                },
                icon: Obx(() => PhosphorIcon(
                      controller.currentIndex.value == 3
                          ? PhosphorIconsFill.microphoneStage
                          : PhosphorIconsRegular.microphoneStage,
                      size: 29.0,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
