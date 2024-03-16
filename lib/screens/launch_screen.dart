import 'package:flutter/material.dart';
import 'package:podkes/screens/home.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen(this.start, {super.key});

  final void Function() start;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const Color backgroundColor = Color(0xFF1F1D2B);
    const Color primaryColor = Color(0xFFFFFFFF);
    const Color secondaryColor = Color(0xFFC4C4C4);
    const Color thirdColor = Color(0xFF525298);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible( // Dynamic spacer
                    child: Container(),
                    flex: 3,
                  ),
                  ClipRRect(
                    child: Image.asset(
                      'assets/launchPic1.png',
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.4,
                    ),
                  ),
                  Flexible( // Dynamic spacer
                    child: Container(),
                    flex: 1,
                  ),
                  const Text(
                    'Podkes',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                        'A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: secondaryColor,
                        )
                    ),
                  ),
                  Flexible( // Dynamic spacer
                    child: Container(),
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset('assets/dots.png'),
                  ),
                  Flexible( // Dynamic spacer
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: start,
                    child: Image.asset('assets/launchButton.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
