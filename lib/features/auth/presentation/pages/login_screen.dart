import 'package:assignment/core/routes/app_router.gr.dart';
import 'package:assignment/core/widgets/custom_button.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_state.dart';
import 'package:assignment/features/home/presentation/pages/home_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    _checkLoginStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('userEmail')) {
        context.router.replace(const HomeRoute());
      }
    }

    _checkLoginStatus();

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            current is InitialState || current is LoadingState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialState:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Expanded(flex: 150, child: SizedBox()),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'login screen',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff1F41BB)),
                          )),
                      const Expanded(flex: 26, child: SizedBox()),
                      Text(
                        'Welcome back you’ve\nebeen missed!',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Expanded(flex: 74, child: SizedBox()),
                      TextFormField(
                        controller: emailController,
                        cursorColor: const Color(0xff1F41BB),
                        validator: (value) {
                          const emailPattern = r'^[^@]+@[^@]+\.[^@]+';

                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(emailPattern).hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1F41BB)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: const Color(0xffF1F4FF),
                            hintText: 'Email',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff626262)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      const Expanded(flex: 29, child: SizedBox()),
                      TextFormField(
                        controller: passwordController,
                        cursorColor: const Color(0xff1F41BB),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1F41BB)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: const Color(0xffF1F4FF),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff626262)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      const Expanded(flex: 30, child: SizedBox()),
                      // GestureDetector(
                      //   onTap: () {
                      //     print('forgot password tap');
                      //   },
                      //   child: Align(
                      //     alignment: Alignment.topRight,
                      //     child: Text(
                      //       'Forgot your password?',
                      //       overflow: TextOverflow.ellipsis,
                      //       style: GoogleFonts.poppins(
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w500,
                      //           color: const Color(0xff1F41BB)),
                      //     ),
                      //   ),
                      // ),
                      const Expanded(flex: 30, child: SizedBox()),
                      CustomButton(
                          text: 'Login',
                          color: const Color(0xff1F41BB),
                          onpress: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                  LoginButtonClickedEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
                              print('login');
                            }
                          },
                          foreGroundColor: Colors.white),
                      const Expanded(flex: 40, child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          context.router.push(const RegisterRoute());
                        },
                        child: Text(
                          'Create new account',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Expanded(flex: 200, child: SizedBox()),
                    ],
                  ),
                ),
              );

            case LoadingState:
              return const Center(child: CircularProgressIndicator());

            default:
              return const Center(child: Text('Something Went Wrong'));
          }
        },
        listenWhen: (previous, current) =>
            current is LoadedState ||
            current is NavigateToHomeState ||
            current is ErrorState,
        listener: (context, state) {
          switch (state.runtimeType) {
            case LoadedState:
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.greenAccent,
                content: Text('Login successful'),
                duration: Duration(seconds: 2),
              ));
              break;

            case NavigateToHomeState:
              context.router.replace(const HomeRoute());
              break;

            case ErrorState:
              final errorState = state as ErrorState;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const ContinuousRectangleBorder(),
                    actions: [
                      Text("Error Occurs ${errorState.error}"),
                      ElevatedButton(
                          onPressed: () {
                            // context.router.push(const LoginRoute());
                            BlocProvider.of<AuthBloc>(context)
                                .add(AuthInitialEvent());

                            context.router.maybePop();
                          },
                          child: const Text('Close'))
                    ],
                  );
                },
              );
              break;
          }
        },
      ),
    );
  }
}
