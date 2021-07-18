import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActiveProjectCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;
  final String progressNumber;
  final double progressPercent;

  const ActiveProjectCard({
    Key? key,
    required this.cardColor,
    required this.title,
    required this.subtitle,
    required this.progressNumber,
    required this.progressPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Container(
      height: screenHeight * 0.3,
      width: screenHeight * 0.2,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(screenHeight * 0.04),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            animation: true,
            radius: screenHeight * 0.15,
            lineWidth: screenHeight * 0.01,
            percent: progressPercent,
            backgroundColor: Colors.white.withOpacity(0.2),
            progressColor: Colors.white,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              progressNumber,
              style: TextStyle(
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: screenHeight * 0.015,
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(0.6),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}