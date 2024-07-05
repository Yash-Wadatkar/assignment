import 'package:assignment/core/routes/app_router.gr.dart';
import 'package:assignment/core/widgets/custom_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userEmail')) {
      context.router.replace(const HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            const Expanded(flex: 50, child: SizedBox()),
            SvgPicture.asset(
              'assets/images/onboarding.svg',
            ),
            const Expanded(flex: 37, child: SizedBox()),
            Text('Discover Your\nDream Job here',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1F41BB))),
            const Expanded(flex: 100, child: SizedBox()),
            CustomButton(
              text: 'Login',
              color: const Color(0xff1F41BB),
              onpress: () {
                context.router.replace(const LoginRoute());
              },
              foreGroundColor: Colors.white,
            ),
            const Expanded(flex: 35, child: SizedBox()),
            CustomButton(
              text: 'Register',
              color: Colors.white,
              onpress: () {
                context.router.replace(const RegisterRoute());
              },
              foreGroundColor: Colors.black,
            ),
            const Expanded(flex: 100, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
