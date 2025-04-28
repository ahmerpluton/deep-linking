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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text("Data from Deep Link is below"),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.teal[100],
              ),
              child: Center(
                child: Text("Data 1 : ${widget.data1.toString()}"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.teal[100],
              ),
              child: Center(
                child: Text("Data 2 : ${widget.data2.toString()}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
