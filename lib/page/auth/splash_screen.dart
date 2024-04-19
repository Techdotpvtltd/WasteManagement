import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteapp/blocs/auth/auth_bloc.dart';
import 'package:wasteapp/blocs/auth/auth_event.dart';
import 'package:wasteapp/blocs/auth/auth_state.dart';
import 'package:wasteapp/page/auth/intro_page.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthEventSplashAction());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateSplashActionDone) {
          NavigationService.offAll(UserDrawer());
        }

        if (state is AuthStateLoginRequired) {
          NavigationService.off(IntroPage());
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child:
                    Image.asset("assets/images/splash.png", fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
