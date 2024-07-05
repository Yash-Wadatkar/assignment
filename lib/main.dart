import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/core/routes/app_router.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment/features/auth/presentation/register_bloc/register_bloc.dart';
import 'package:assignment/features/auth/presentation/register_bloc/register_event.dart';
import 'package:assignment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setUp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()..add(AuthInitialEvent())),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc()..add(RegisterInitialEvent()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
