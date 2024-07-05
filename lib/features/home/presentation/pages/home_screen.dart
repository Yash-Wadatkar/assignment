import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/features/auth/domain/usecase/auth_usecase.dart';
import 'package:assignment/features/auth/presentation/pages/login_screen.dart';
import 'package:assignment/features/home/domain/usecase/user_usecase.dart';
import 'package:assignment/features/home/presentation/widget/custom_card.dart';
import 'package:assignment/core/routes/app_router.gr.dart';
import 'package:assignment/features/onboarding/onboarding_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _checkLoginStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userEmail')) {
      context.router.replace(const LoginRoute());
    }
  }

  Future<void> _logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await locator<AuthUsecase>().logOutUserUsecase();
    await prefs.remove('userEmail');
    //context.router.replace(const LoginRoute());
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const OnboardingScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    _checkLoginStatus(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Users List Screen',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xff626262),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logOut(context),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: locator<UserUsecase>().getUserUsecase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
              'No users found',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff626262)),
            ));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      CustomCard(
                        documentId: users[index].email,
                        index: index,
                        userList: users,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
