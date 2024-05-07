import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fakestore/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/category/presentation/pages/main_page.dart';

void main() async {
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FakeStore',
        home: MainPage(),
      ),
    );
  }
}
