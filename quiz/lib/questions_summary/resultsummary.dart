import 'package:flutter/material.dart';
import 'package:quiz/questions_summary/summaryitem.dart';

class ResultSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const ResultSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: summaryData.map((data) {
          return SummaryItem(summaryData: data);
        }).toList()),
      ),
    );
  }
}
