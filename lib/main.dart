import 'package:deep_linking/splash_screen.dart';
import 'package:deep_linking/unilink_service.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

// Define the navigatorKey globally
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UniLinksService.init(); // no await
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Linking',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
