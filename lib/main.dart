import 'package:fakestore/core/routes/routes.dart';
import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fakestore/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:fakestore/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<CategoryCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'FakeStore',
        routerConfig: appRouter.config(),
      ),
    );
  }
}
