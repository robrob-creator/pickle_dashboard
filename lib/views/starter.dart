import 'package:pickle/controllers/starter_controller.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  StarterPageState createState() => StarterPageState();
}

class StarterPageState extends State<StarterPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late StarterController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(StarterController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<StarterController>(
            controller: controller,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.x(flexSpacing),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleMedium(
                          "Starter",
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'Starter', active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
