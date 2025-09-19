import 'package:e_commerce/feature/app_section/app_section.dart';
import 'package:e_commerce/feature/auth/data/repo/repository/auth_repository_imp.dart';
import 'package:e_commerce/feature/auth/presentation/view/login_screen.dart';
import 'package:e_commerce/feature/auth/presentation/view/register_screen.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:e_commerce/feature/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User App",
      initialRoute: AppSection.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => BlocProvider(
          create: (context) => LoginCubit(repositoryInjectable()),
          child: const LoginScreen(),
        ),
        RegisterScreen.routeName: (context) => BlocProvider(
          create: (context) => RegisterCubit(repositoryInjectable()),
          child: const RegisterScreen(),
        ),
        AppSection.routeName: (context) => const AppSection(),
      },
    );
  }
}
