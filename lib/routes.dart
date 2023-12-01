import 'dart:developer';

import 'package:pickle/services/auth_service.dart';
import 'package:pickle/views/apps/ecommerce/add_product.dart';
import 'package:pickle/views/apps/ecommerce/customers.dart';
import 'package:pickle/views/apps/ecommerce/products.dart';
import 'package:pickle/views/auth/forgot_password.dart';
import 'package:pickle/views/auth/locked.dart';
import 'package:pickle/views/auth/login.dart';
import 'package:pickle/views/auth/register.dart';
import 'package:pickle/views/auth/reset_password.dart';
import 'package:pickle/views/dashboard.dart';
import 'package:pickle/views/faqs_page.dart';
import 'package:pickle/views/forms/basic.dart';
import 'package:pickle/views/forms/form_mask.dart';
import 'package:pickle/views/forms/validation.dart';
import 'package:pickle/views/forms/wizard.dart';
import 'package:pickle/views/other/basic_table.dart';
import 'package:pickle/views/other/google_map.dart';
import 'package:pickle/views/other/syncfusion_charts.dart';
import 'package:pickle/views/starter.dart';
import 'package:pickle/views/ui/buttons.dart';
import 'package:pickle/views/ui/cards.dart';
import 'package:pickle/views/ui/carousels.dart';
import 'package:pickle/views/ui/dialogs.dart';
import 'package:pickle/views/ui/drag_drop.dart';
import 'package:pickle/views/ui/notifications.dart';
import 'package:pickle/views/ui/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class AuthMiddleware extends FxMiddleware {
  @override
  String handle(String routeName) {
    return AuthService.isLoggedIn ? routeName : '/auth/login';
  }
}

PageRouteBuilder generateRoute(BuildContext context, RouteSettings settings) {
  // Starter

  FxRoutes.registerRoute(
      FxRoute(name: '/starter', builder: (_) => const StarterPage()));

  FxRoutes.registerRoute(
      FxRoute(name: '/faqs', builder: (_) => const FAQsPage()));

  // Authentication
  FxRoutes.registerRoute(
      FxRoute(name: '/auth/login', builder: (_) => const LoginPage()));

  FxRoutes.registerRoute(FxRoute(
    name: '/auth/register',
    builder: (_) => RegisterPage(),
  ));

  FxRoutes.registerRoute(FxRoute(
    name: '/auth/forgot_password',
    builder: (_) => ForgotPasswordPage(),
  ));
  FxRoutes.registerRoute(FxRoute(
    name: '/auth/reset_password',
    builder: (_) => ResetPasswordPage(),
  ));
  FxRoutes.registerRoute(FxRoute(
    name: '/auth/locked',
    builder: (_) => LockedPage(),
  ));

  //Dashboard
  FxRoutes.registerRoute(FxRoute(
      name: '/dashboard',
      builder: (_) => const DashboardPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/',
      builder: (_) => const DashboardPage(),
      middlewares: [AuthMiddleware()]));

  ///========== Apps =================///

  //Ecommerce
  FxRoutes.registerRoute(FxRoute(
      name: '/apps/ecommerce/products',
      builder: (_) => const EcommerceProductsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
    name: '/apps/ecommerce/add_product',
    builder: (_) => AddProductPage(),
  ));

  FxRoutes.registerRoute(FxRoute(
    name: '/apps/ecommerce/customers',
    builder: (_) => CustomersPage(),
  ));

  ///========== UI =================///

  // UI Pages
  FxRoutes.registerRoute(FxRoute(
      name: '/ui/buttons',
      builder: (_) => const ButtonsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/ui/cards',
      builder: (_) => const CardsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/ui/tabs',
      builder: (_) => const TabsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/ui/dialogs',
      builder: (_) => const DialogsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/ui/carousels',
      builder: (_) => const CarouselsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/ui/drag_drop',
      builder: (_) => const DragDropPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/ui/notifications',
      builder: (_) => const NotificationsPage(),
      middlewares: [AuthMiddleware()]));

  // Forms
  FxRoutes.registerRoute(FxRoute(
      name: '/forms/basic',
      builder: (_) => const BasicFormsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/forms/validation',
      builder: (_) => const ValidationFormsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/forms/wizard',
      builder: (_) => const WizardPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/forms/masks',
      builder: (_) => const FormMaskPage(),
      middlewares: [AuthMiddleware()]));

  // Other
  FxRoutes.registerRoute(FxRoute(
      name: '/other/basic_tables',
      builder: (_) => const BasicTablesPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/other/syncfusion_charts',
      builder: (_) => const SyncfusionChartsPage(),
      middlewares: [AuthMiddleware()]));

  FxRoutes.registerRoute(FxRoute(
      name: '/other/google_maps',
      builder: (_) => const GoogleMapPage(),
      middlewares: [AuthMiddleware()]));

  //Finding Routes
  FxRoute? route = FxRouter.getSecuredRouteFromRouteName(settings.name ?? '/');

  Uri? settingsUri;
  if (route != null && settings.name != route.name) {
    settingsUri = Uri.parse(Uri.parse("${route.name}").path);
    if (settingsUri.queryParameters['next'] == null) {
      settingsUri = settingsUri.replace(
          queryParameters: {'next': Uri.parse(settings.name ?? "").path});
    }
  }

  return PageRouteBuilder(
    settings: RouteSettings(
      arguments: settings.arguments,
      name: settingsUri?.toString() ?? settings.name,
    ),
    pageBuilder: (context, animation1, animation2) =>
        route != null ? route.builder(context) : StarterPage(),
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}
