import 'dart:async';

import 'package:deep_linking/detail_screen.dart';
import 'package:deep_linking/main.dart';
import 'package:deep_linking/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            RoutingService.push(const DetailScreen(
              data1: "123",
              data2: "\$120",
            ));
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.teal[100],
            ),
            child: const Center(
              child: Text("Go To Detail Screen"),
            ),
          ),
        ),
      ),
    );
  }
}
