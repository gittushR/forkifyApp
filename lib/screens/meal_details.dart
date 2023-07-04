import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Details"),
      ),
      body: const Center(
        child: Text("Meal Details"),
      ),
    );
  }
}
