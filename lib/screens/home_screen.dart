import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task/components/data_search.dart';
import 'package:flutter_task/components/progress_indicator.dart';
import 'package:flutter_task/components/project_card.dart';
import 'package:flutter_task/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return AnimatedContainer(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(isDrawerOpen ? screenHeight * 0.04 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kAppBarColor,
                borderRadius: BorderRadius.circular(screenHeight * 0.04),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: screenHeight * 0.04,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: screenHeight * 0.04,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = screenHeight * 0.4;
                                    yOffset = screenHeight * 0.15;
                                    scaleFactor = 0.75;
                                    isDrawerOpen = true;
                                  });
                                },
                              ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: screenHeight * 0.04,
                          ),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: DataSearch(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.025,
                      horizontal: screenHeight * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomProgressIndicator(),
                        SizedBox(
                          width: screenHeight * 0.02,
                        ),
                        Column(
                          children: [
                            Text(
                              'Adnan Karim',
                              style: TextStyle(
                                fontFamily:
                                    'assets/fonts/CircularStd-Medium.otf',
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.035,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              'App Developer',
                              style: TextStyle(
                                fontFamily:
                                    'assets/fonts/CircularStd-Light.otf',
                                fontWeight: FontWeight.w600,
                                fontSize: screenHeight * 0.02,
                                letterSpacing: 1,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                      fontFamily: 'assets/fonts/CircularStd-Medium.otf',
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.04,
                      letterSpacing: 1,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: screenHeight * 0.07,
                      width: screenHeight * 0.07,
                      decoration: const BoxDecoration(
                        color: kSecondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                        size: screenHeight * 0.03,
                      ),
                    ),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2099),
                      ).then((date) => null);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: screenHeight * 0.05,
                        width: screenHeight * 0.05,
                        decoration: const BoxDecoration(
                          color: kAvatarProgressIndicatorColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: screenHeight * 0.02,
                        ),
                      ),
                      SizedBox(
                        width: screenHeight * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To Do',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/CircularStd-Medium.otf',
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.025,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            '5 tasks now. 1 started',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/CircularStd-Light.otf',
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.017,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        height: screenHeight * 0.05,
                        width: screenHeight * 0.05,
                        decoration: const BoxDecoration(
                          color: kAppBarColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: screenHeight * 0.02,
                        ),
                      ),
                      SizedBox(
                        width: screenHeight * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'In Progress',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/CircularStd-Medium.otf',
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.025,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            '1 tasks now. 1 started',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/CircularStd-Light.otf',
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.017,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        height: screenHeight * 0.05,
                        width: screenHeight * 0.05,
                        decoration: const BoxDecoration(
                          color: kDrawerColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                          size: screenHeight * 0.02,
                        ),
                      ),
                      SizedBox(
                        width: screenHeight * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Done',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/CircularStd-Medium.otf',
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.025,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            '18 tasks now. 13 started',
                            style: TextStyle(
                              fontFamily: 'assets/fonts/CircularStd-Light.otf',
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.017,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Active Projects',
                    style: TextStyle(
                      fontFamily: 'assets/fonts/CircularStd-Medium.otf',
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.04,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenHeight * 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ActiveProjectCard(
                        cardColor: kSecondaryColor,
                        title: 'Medical App',
                        subtitle: '9 hours progress',
                        progressNumber: '25%',
                        progressPercent: 0.25,
                      ),
                      ActiveProjectCard(
                        cardColor: kAppBarColor,
                        title: 'Making History Notes',
                        subtitle: '20 hours progress',
                        progressNumber: '60%',
                        progressPercent: 0.6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ActiveProjectCard(
                        cardColor: kAvatarProgressIndicatorColor,
                        title: 'Title',
                        subtitle: 'Progress',
                        progressNumber: '82%',
                        progressPercent: 0.82,
                      ),
                      ActiveProjectCard(
                        cardColor: kDrawerColor,
                        title: 'Title',
                        subtitle: 'Progress',
                        progressNumber: '37%',
                        progressPercent: 0.37,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
