import 'package:deep_linking/home_screen.dart';
import 'package:deep_linking/routing_service.dart';
import 'package:deep_linking/unilink_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> handleUserNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    await UniLinksService.handleInitialUriIfNeeded();
    RoutingService.pushAndRemoveUntil(const HomeScreen());
  }

  @override
  void initState() {
    handleUserNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 50,
                  right: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 48,
                        width: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.white),
                        child: const Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
