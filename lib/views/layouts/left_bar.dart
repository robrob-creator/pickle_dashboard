import 'package:pickle/extensions/string.dart';
import 'package:pickle/images.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/services/theme/theme_customizer.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/widgets/custom_pop_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = {};

  static attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static detachListener(String key) {
    observers.remove(key);
  }

  static notifyAll(String key) {
    for (var fn in observers.values) {
      fn(key);
    }
  }
}

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({Key? key, this.isCondensed = false}) : super(key: key);

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar>
    with SingleTickerProviderStateMixin, UIMixin {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;
  String path = Uri.base.fragment;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return FxCard(
      paddingAll: 0,
      shadow: FxShadow(position: FxShadowPosition.centerRight, elevation: 0.2),
      child: AnimatedContainer(
        color: leftBarTheme.background,
        width: isCondensed ? 70 : 244,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        FxRouter.pushNamed(context, '/dashboard');
                      },
                      child: Image.asset(Images.logoIcon,
                          height: widget.isCondensed ? 24 : 32)),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: FxSpacing.width(16),
                    ),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: FxText.labelLarge(
                        "Pickle",
                        style: GoogleFonts.raleway(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: colorScheme.primary,
                          letterSpacing: 1,
                        ),
                        maxLines: 1,
                      ),
                    )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationItem(
                    iconData: Icons.dashboard_outlined,
                    title: "dashboard".tr(),
                    isCondensed: isCondensed,
                    route: '/dashboard',
                  ),
                  // labelWidget("apps".tr()),
                  // MenuWidget(
                  //   iconData: Icons.storefront_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "ecommerce".tr(),
                  //   children: [
                  //     MenuItem(
                  //       title: "products".tr(),
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/products',
                  //     ),
                  //     MenuItem(
                  //       title: "add_product".tr(),
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/add_product',
                  //     ),
                  //     MenuItem(
                  //       title: "customers".tr(),
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/customers',
                  //     ),
                  //   ],
                  // ),
                  // labelWidget("pages".tr()),
                  // MenuWidget(
                  //   iconData: Icons.admin_panel_settings_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "auth".tr(),
                  //   children: [
                  //     MenuItem(
                  //       title: "login".tr(),
                  //       route: '/auth/login',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "register".tr(),
                  //       route: '/auth/register',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "forgot_password".tr(),
                  //       route: '/auth/forgot_password',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "reset_password".tr(),
                  //       route: '/auth/reset_password',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "locked".tr(),
                  //       route: '/auth/locked',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // MenuWidget(
                  //   iconData: Icons.widgets_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "widgets".tr(),
                  //   children: [
                  //     MenuItem(
                  //       title: "buttons".tr(),
                  //       route: '/ui/buttons',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "cards".tr(),
                  //       route: '/ui/cards',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "tabs".tr(),
                  //       route: '/ui/tabs',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "dialogs".tr(),
                  //       route: '/ui/dialogs',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "carousels".tr(),
                  //       route: '/ui/carousels',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "drag_drop".tr(),
                  //       route: '/ui/drag_drop',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "notifications".tr(),
                  //       route: '/ui/notifications',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // MenuWidget(
                  //   iconData: Icons.post_add_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "form".tr(),
                  //   children: [
                  //     MenuItem(
                  //       title: "basic".tr(),
                  //       route: '/forms/basic',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "validations".tr(),
                  //       route: '/forms/validation',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "masks".tr(),
                  //       route: '/forms/masks',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "wizard".tr(),
                  //       route: '/forms/wizard',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.insert_drive_file_outlined,
                  //   title: "starter".tr(),
                  //   route: '/starter',
                  //   isCondensed: isCondensed,
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.list_alt_rounded,
                  //   title: "FAQs".tr(),
                  //   route: '/faqs',
                  //   isCondensed: isCondensed,
                  // ),
                  // labelWidget("other".tr()),
                  // NavigationItem(
                  //   iconData: Icons.table_chart_outlined,
                  //   title: "basic_tables".tr(),
                  //   route: '/other/basic_tables',
                  //   isCondensed: isCondensed,
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.insert_chart_outlined,
                  //   title: "syncfusion_chart".tr(),
                  //   route: '/other/syncfusion_charts',
                  //   isCondensed: isCondensed,
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.map_outlined,
                  //   title: "google_map".tr(),
                  //   isCondensed: isCondensed,
                  //   route: '/other/google_maps',
                  // ),
                  // FxSpacing.height(16),
                  // if (!isCondensed)
                  //   Center(
                  //     child: FxButton(
                  //         borderRadiusAll: AppStyle.buttonRadius.small,
                  //         elevation: 0,
                  //         padding: FxSpacing.xy(12, 16),
                  //         onPressed: () {},
                  //         backgroundColor: colorScheme.primary,
                  //         child: FxText.labelMedium(
                  //           'purchase_now'.tr(),
                  //           color: colorScheme.onPrimary,
                  //         )),
                  //   ),
                  // FxSpacing.height(32),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? FxSpacing.empty()
        : Container(
            padding: FxSpacing.xy(24, 8),
            child: FxText.labelSmall(
              label.toUpperCase(),
              color: leftBarTheme.labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}

class MenuWidget extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItem> children;

  const MenuWidget(
      {super.key,
      required this.iconData,
      required this.title,
      this.isCondensed = false,
      this.active = false,
      this.children = const []});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget>
    with UIMixin, SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isActive = false;
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));
    LeftbarObserver.attachListener(widget.title, onChangeMenuActive);
  }

  void onChangeMenuActive(String key) {
    if (key != widget.title) {
      // onChangeExpansion(false);
    }
  }

  void onChangeExpansion(value) {
    isActive = value;
    if (isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = Uri.base.fragment;
    isActive = widget.children.any((element) => element.route == route);
    onChangeExpansion(isActive);
    if (hideFn != null) {
      hideFn!();
    }
    // popupShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    // var route = Uri.base.fragment;
    // isActive = widget.children.any((element) => element.route == route);

    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (_) => hideFn = _,
        onChange: (_) {
          // popupShowing = _;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: FxContainer.transparent(
            margin: FxSpacing.fromLTRB(16, 0, 16, 8),
            color: isActive || isHover
                ? leftBarTheme.activeItemBackground
                : Colors.transparent,
            padding: FxSpacing.xy(8, 8),
            child: Center(
              child: Icon(
                widget.iconData,
                color: (isHover || isActive)
                    ? leftBarTheme.activeItemColor
                    : leftBarTheme.onBackground,
                size: 20,
              ),
            ),
          ),
        ),
        menuBuilder: (_) => FxContainer.bordered(
          paddingAll: 8,
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
        ),
      );
    } else {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FxContainer.transparent(
          margin: FxSpacing.fromLTRB(24, 0, 16, 0),
          paddingAll: 0,
          child: ListTileTheme(
            contentPadding: EdgeInsets.all(0),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child: ExpansionTile(
                tilePadding: FxSpacing.zero,
                initiallyExpanded: isActive,
                maintainState: true,
                onExpansionChanged: (_) {
                  LeftbarObserver.notifyAll(widget.title);
                  onChangeExpansion(_);
                },
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.expand_more,
                    size: 18,
                    color: leftBarTheme.onBackground,
                  ),
                ),
                iconColor: leftBarTheme.activeItemColor,
                childrenPadding: FxSpacing.x(12),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.iconData,
                      size: 20,
                      color: isHover || isActive
                          ? leftBarTheme.activeItemColor
                          : leftBarTheme.onBackground,
                    ),
                    FxSpacing.width(18),
                    Expanded(
                      child: FxText.labelLarge(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        color: isHover || isActive
                            ? leftBarTheme.activeItemColor
                            : leftBarTheme.onBackground,
                      ),
                    ),
                  ],
                ),
                collapsedBackgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                backgroundColor: Colors.transparent,
                children: widget.children),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const MenuItem({
    Key? key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = Uri.base.fragment == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          FxRouter.pushReplacementNamed(context, widget.route!, arguments: 1);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FxContainer.transparent(
          margin: FxSpacing.fromLTRB(4, 0, 8, 4),
          color: isActive || isHover
              ? leftBarTheme.activeItemBackground
              : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: FxSpacing.xy(18, 7),
          child: FxText.bodySmall(
            "${widget.isCondensed ? "" : "- "}  ${widget.title}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.left,
            fontSize: 12.5,
            color: isActive || isHover
                ? leftBarTheme.activeItemColor
                : leftBarTheme.onBackground,
            fontWeight: isActive || isHover ? 600 : 500,
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const NavigationItem(
      {Key? key,
      this.iconData,
      required this.title,
      this.isCondensed = false,
      this.route})
      : super(key: key);

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = Uri.base.fragment == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          FxRouter.pushReplacementNamed(context, widget.route!, arguments: 1);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FxContainer.transparent(
          margin: FxSpacing.fromLTRB(16, 0, 16, 8),
          color: isActive || isHover
              ? leftBarTheme.activeItemBackground
              : Colors.transparent,
          padding: FxSpacing.xy(8, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.iconData != null)
                Center(
                  child: Icon(
                    widget.iconData,
                    color: (isHover || isActive)
                        ? leftBarTheme.activeItemColor
                        : leftBarTheme.onBackground,
                    size: 20,
                  ),
                ),
              if (!widget.isCondensed)
                Flexible(
                  fit: FlexFit.loose,
                  child: FxSpacing.width(16),
                ),
              if (!widget.isCondensed)
                Expanded(
                  flex: 3,
                  child: FxText.labelLarge(
                    widget.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    color: isActive || isHover
                        ? leftBarTheme.activeItemColor
                        : leftBarTheme.onBackground,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
