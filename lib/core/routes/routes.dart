import 'package:auto_route/auto_route.dart';
import 'package:fakestore/core/constants/constants.dart';
import 'package:fakestore/core/routes/routes.gr.dart';
import 'package:fakestore/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: MainRoute.page, initial: true, guards: [AuthGuard()]),
        AutoRoute(page: CategoriesRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: CategoryRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: ProductDetailRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: CartRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: ProfileRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: EditProfileRoute.page, guards: [AuthGuard()]),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final prefs = sl<SharedPreferences>();
    // Check if user is authenticated
    bool isAuthenticated = prefs.getString(AppConsts.token) != null;

    if (isAuthenticated) {
      // User is authenticated, allow navigation
      resolver.next(true);
    } else {
      // User is not authenticated, redirect to sign in page
      router.push(const SignInRoute());
      resolver.next(false);
    }
  }
}
