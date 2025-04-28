import 'package:deep_linking/home_screen.dart';
import 'package:deep_linking/routing_service.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String data1;
  final String data2;

  const DetailScreen({super.key, required this.data1, required this.data2});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ✅ When back button pressed, go to HomeScreen
        RoutingService.pushAndRemoveUntil(const HomeScreen());
        return false; // Prevent default back behavior
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Screen"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text("Data from Deep Link is below"),
            const SizedBox(height: 50),
            Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.teal[100],
                ),
                child: Center(
                  child: Text("Data 1 : ${widget.data1}"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.teal[100],
                ),
                child: Center(
                  child: Text("Data 2 : ${widget.data2}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
