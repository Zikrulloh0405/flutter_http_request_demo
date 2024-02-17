import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String id = "detail_page";
  final String title;
  final String subtitle;

  const DetailPage({super.key, required this.title, required this.subtitle});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.title),
            Text("${widget.subtitle}\$"),
          ],
        ),
      ),
    );
  }
}
