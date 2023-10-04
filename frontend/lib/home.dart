import 'package:backend_project/services/api.dart';
import 'package:backend_project/services/edit.dart';
import 'package:flutter/material.dart';
import 'package:backend_project/create.dart';
import 'package:backend_project/services/update.dart';

import 'delete.dart';
import 'fetch.dart';
import 'model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateData(),
                  ),
                );
              },
              child: Text("CREATE"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FetchData()));
                },
                child: Text("READ")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const UpdateScreen(), // Navigate to the UpdateScreen
                  ),
                );
              },
              child: Text("UPDATE"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DeleteScreen(), // Navigate to the UpdateScreen
                    ),
                  );
                },
                child: Text("DELETE")),
          ],
        ),
      ),
    );
  }
}
