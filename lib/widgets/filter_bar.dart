import 'package:flutter/material.dart';

class FilterBarWidget extends StatelessWidget {
  const FilterBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("April 2026")),
            ),
          ),

          const Expanded(
            child: Center(child: Text("All")),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("Income")),
            ),
          ),
        ],
      ),
    );
  }
}