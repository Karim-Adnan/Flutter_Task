import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/configuration.dart';
import 'package:flutter_task/constants.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Container(
      color: kDrawerColor,
      padding: EdgeInsets.only(
        top: screenHeight * 0.09,
        bottom: screenHeight * 0.03,
        left: screenHeight * 0.025,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/profileImg.png",
                ),
              ),
              SizedBox(
                width: screenHeight * 0.02,
              ),
              Text(
                'Adnan Karim',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.025,
                  letterSpacing: 1,
                ),
              )
            ],
          ),
          Column(
            children: drawerItems
                .map(
                  (e) => Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            e['icon'],
                            color: Colors.white,
                            size: screenHeight * 0.03,
                          ),
                          SizedBox(
                            width: screenHeight * 0.02,
                          ),
                          Text(
                            e['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.02,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: screenHeight * 0.02,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize:screenHeight * 0.02,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Row(
                children: [
                  Icon(
                    Icons.headset_mic_rounded,
                    color: Colors.white,
                    size: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: screenHeight * 0.02,
                  ),
                  Text(
                    'Support',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.02,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
