import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          bool responseIsCorrect =
              data['user_answer'] as String == data['correct_answer'] as String;
          Color responseColor = responseIsCorrect ? Colors.green : Colors.red;

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: responseColor,
                  ),
                  child: Center(
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  // Don't ignore the maximum widht for the parent.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(color: responseColor),
                      ),
                      if (!responseIsCorrect) Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          data['correct_answer'] as String,
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList()
            // children: [
            //   ...summaryData.map((data) {
            //     return Row(children: [
            //       Text(((data['question_index'] as int) + 1).toString()),
            //     ]);
            //   })
            // ],
            ),
      ),
    );
  }
}
