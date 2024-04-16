import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/auth/auth_bloc.dart';
import 'package:wasteapp/blocs/auth/auth_state.dart';
import 'package:wasteapp/blocs/conversation/conversation_bloc.dart';
import 'package:wasteapp/blocs/message/mesaage_bloc.dart';
import 'package:wasteapp/blocs/picking/picking_bloc.dart';
import 'package:wasteapp/blocs/request/request_bloc.dart';
import 'package:wasteapp/blocs/user/user_bloc.dart';
import 'package:wasteapp/page/auth/splash_screen.dart';
import 'package:wasteapp/page/home/drawer.dart';

import 'firebase_options.dart';
import 'manager/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'services/notification_services/push_notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //  1 - Ensure firebase app is initialized if starting from background/terminated state
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize time zone data
  tz.initializeTimeZones();
  // Obtain the local time zone
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  // Set the local time zone
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  runApp(const MyApp());
  await PushNotificationServices().initialize(); // Enabled Push notification
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
            BlocProvider<UserBloc>(create: (context) => UserBloc()),
            BlocProvider<PickingBloc>(create: (context) => PickingBloc()),
            BlocProvider<RequestBloc>(create: (context) => RequestBloc()),
            BlocProvider<ConversationBloc>(
                create: (context) => ConversationBloc()),
            BlocProvider<MessageBloc>(create: (context) => MessageBloc()),
          ],
          child: MaterialApp(
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            home: _WasteApp(),
          ),
        );
      },
    );
  }
}

class _WasteApp extends StatelessWidget {
  const _WasteApp();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return UserDrawer();
        }
        return SplashScreen();
      },
      buildWhen: (previous, current) {
        return current is AuthStateLoggedIn;
      },
    );
  }
}

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
