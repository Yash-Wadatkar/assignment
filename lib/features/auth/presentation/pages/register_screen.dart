import 'package:assignment/core/routes/app_router.gr.dart';
import 'package:assignment/core/widgets/custom_button.dart';

import 'package:assignment/features/auth/presentation/register_bloc/register_bloc.dart';
import 'package:assignment/features/auth/presentation/register_bloc/register_event.dart';
import 'package:assignment/features/auth/presentation/register_bloc/register_state.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) =>
            current is RegisterInitialRegisterState ||
            current is RegisterLoadingState ||
            current is RegisterErrorState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case RegisterInitialRegisterState:
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 97, bottom: 6),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Create Account',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff1F41BB)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 53),
                          child: Text(
                            'Create an account so you can explore all the existing jobs',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextFormField(
                          controller: firstNameController,
                          cursorColor: const Color(0xff1F41BB),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First Name is required';
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
                            hintText: 'First Name',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff626262)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 26),
                          child: TextFormField(
                            controller: lastNameController,
                            cursorColor: const Color(0xff1F41BB),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Last Name is required';
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
                              hintText: 'Last Name',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff626262)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
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
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 26, bottom: 53),
                          child: TextFormField(
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
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        CustomButton(
                            text: 'Register',
                            color: const Color(0xff1F41BB),
                            onpress: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterButtonClickedEvent(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text));
                                print('register');
                              }
                            },
                            foreGroundColor: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: GestureDetector(
                            onTap: () {
                              print('go back');
                              context.router.push(const LoginRoute());
                            },
                            child: Text(
                              'Already have an account',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

            case RegisterLoadingState:
              return const Center(child: CircularProgressIndicator());

            case RegisterErrorState:
              final errorState = state as RegisterErrorState;
              return Center(
                  child: Text('Error has occurred: ${errorState.error}'));

            default:
              return const Center(child: Text('Something went wrong'));
          }
        },
        listenWhen: (previous, current) =>
            current is RegisterLoadedState ||
            current is RegisterNavigateToHomeState,
        listener: (context, state) {
          switch (state.runtimeType) {
            case RegisterLoadedState:
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.greenAccent,
                content: Text('Register successful \n now Please Login'),
                duration: Duration(seconds: 2),
              ));
              break;

            case RegisterNavigateToHomeState:
              context.router.push(LoginRoute());
              break;

            default:
              break;
          }
        },
      ),
    );
  }
}
