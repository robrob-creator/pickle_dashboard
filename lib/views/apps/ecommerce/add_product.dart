import 'package:feather_icons/feather_icons.dart';
import 'package:pickle/controllers/apps/ecommerce/edit_products_controller.dart';
import 'package:pickle/extensions/string.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late AddProductsController controller;

  String? categories;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(AddProductsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder(
        controller: controller,
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: FxSpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.titleMedium(
                      "add_product".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    FxBreadcrumb(
                      children: [
                        FxBreadcrumbItem(name: 'ecommerce'.tr()),
                        FxBreadcrumbItem(
                            name: 'add_product'.tr().capitalizeWords,
                            active: true),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(flexSpacing),
              Padding(
                padding: FxSpacing.x(flexSpacing / 2),
                child: FxFlex(
                  children: [
                    FxFlexItem(
                      sizes: "lg-8 md-12",
                      child: FxCard(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shadow: FxShadow(
                            elevation: 0.5, position: FxShadowPosition.bottom),
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              // width: double.infinity,
                              color: colorScheme.primary.withOpacity(0.08),
                              padding: FxSpacing.xy(16, 12),
                              child: Row(
                                children: [
                                  Icon(
                                    FeatherIcons.server,
                                    color: contentTheme.primary,
                                    size: 16,
                                  ),
                                  FxSpacing.width(12),
                                  FxText.titleMedium(
                                    "general".tr(),
                                    fontWeight: 600,
                                    color: colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: FxSpacing.xy(flexSpacing, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.labelMedium(
                                    "product_name".tr().capitalizeWords,
                                  ),
                                  FxSpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('product_name'),
                                    controller: controller.basicValidator
                                        .getController('product_name'),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: "eg: Tomatoes",
                                      hintStyle:
                                          FxTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: FxSpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  FxSpacing.height(25),
                                  FxText.labelMedium(
                                    "shop_name".tr().capitalizeWords,
                                  ),
                                  FxSpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('shop_name'),
                                    controller: controller.basicValidator
                                        .getController('shop_name'),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: "eg: Fruits",
                                      hintStyle:
                                          FxTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: FxSpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  FxSpacing.height(25),
                                  FxText.labelMedium(
                                    "description".tr(),
                                  ),
                                  FxSpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('description'),
                                    controller: controller.basicValidator
                                        .getController('description'),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText:
                                          "It's contains blah blah things",
                                      hintStyle:
                                          FxTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: FxSpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  FxSpacing.height(25),
                                  FxFlex(contentPadding: false, children: [
                                    FxFlexItem(
                                        sizes: 'lg-6 md-12',
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FxText.labelMedium(
                                              "category".tr(),
                                            ),
                                            FxSpacing.height(8),
                                            DropdownButtonFormField<Category>(
                                              dropdownColor:
                                                  colorScheme.background,
                                              menuMaxHeight: 200,
                                              isDense: true,

                                              // itemHeight: 40,
                                              items: Category.values
                                                  .map(
                                                    (category) =>
                                                        DropdownMenuItem<
                                                            Category>(
                                                      value: category,
                                                      child: FxText.labelMedium(
                                                        category
                                                            .name.capitalize,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                              icon: Icon(
                                                Icons.expand_more,
                                                size: 20,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "Select category",
                                                hintStyle:
                                                    FxTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    FxSpacing.all(14),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                              onChanged: controller
                                                  .basicValidator
                                                  .onChanged<Object?>(
                                                'category',
                                              ),
                                            )
                                          ],
                                        )),
                                    FxFlexItem(
                                        sizes: 'lg-6 md-12',
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FxText.labelMedium(
                                              "price".tr(),
                                            ),
                                            FxSpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('price'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('price'),
                                              keyboardType:
                                                  TextInputType.multiline,
                                              decoration: InputDecoration(
                                                hintText: "19.99",
                                                hintStyle:
                                                    FxTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                prefixIcon: FxContainer.none(
                                                    margin: FxSpacing.right(12),
                                                    alignment: Alignment.center,
                                                    color: contentTheme.primary
                                                        .withAlpha(40),
                                                    child: FxText.labelLarge(
                                                      "\$",
                                                      color:
                                                          contentTheme.primary,
                                                    )),
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                        maxHeight: 42,
                                                        minWidth: 50,
                                                        maxWidth: 50),
                                                contentPadding:
                                                    FxSpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ]),
                                  FxSpacing.height(25),
                                  FxText.labelMedium(
                                    "status".tr(),
                                  ),
                                  FxSpacing.height(4),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                            spacing: 16,
                                            children: Status.values
                                                .map(
                                                  (gender) => InkWell(
                                                    onTap: () => controller
                                                        .onChangeGender(gender),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio<Status>(
                                                          value: gender,
                                                          activeColor: theme
                                                              .colorScheme
                                                              .primary,
                                                          groupValue: controller
                                                              .selectedGender,
                                                          onChanged: controller
                                                              .onChangeGender,
                                                          visualDensity:
                                                              getCompactDensity,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                        ),
                                                        FxSpacing.width(8),
                                                        FxText.labelMedium(
                                                          gender
                                                              .name.capitalize,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList()),
                                      )
                                    ],
                                  ),
                                  FxSpacing.height(25),
                                  FxText.labelMedium(
                                    "tags".tr(),
                                  ),
                                  FxSpacing.height(8),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: TextFormField(
                                      maxLines: 3,
                                      validator: controller.basicValidator
                                          .getValidation('tags'),
                                      controller: controller.basicValidator
                                          .getController('tags'),
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText:
                                            "fruits, vegetables, grocery, healthy, etc",
                                        hintStyle:
                                            FxTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        contentPadding: FxSpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                  FxSpacing.height(20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FxButton.text(
                                        onPressed: () {},
                                        padding: FxSpacing.xy(20, 16),
                                        splashColor: contentTheme.secondary
                                            .withOpacity(0.1),
                                        child: FxText.bodySmall(
                                          'cancel'.tr(),
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'save'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
