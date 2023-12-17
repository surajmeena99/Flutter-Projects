import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.mySummaryData, {super.key});

  final List<Map<String, Object>> mySummaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: mySummaryData.map((data) {  //"map" function applies a given function to each element of the list
              return SummaryItem(data);  //...(itemData: data)
            },
          ).toList(),  //...
        ),
      ),
    );
  }
}
