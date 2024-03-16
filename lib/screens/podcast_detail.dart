import 'package:flutter/material.dart';
import 'package:podkes/models/podcast.dart';

class PodcastDetailScreen extends StatelessWidget {
  final Podcast podcast;

  const PodcastDetailScreen({Key? key, required this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const Color backgroundColor = Color(0xFF1F1D2B);
    const Color primaryColor = Color(0xFFFFFFFF);
    const Color secondaryColor = Color(0xFFC4C4C4);
    const Color accentColor = Color(0xFFFF00FF); // Assuming the pink color is an accent

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/chev.png', width: 20.0, height: 20.0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Now Playing', style: TextStyle(color: primaryColor)),
        centerTitle: true,
      ),
      body: Center( // Center the child vertically and horizontally
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Center the children horizontally
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1), // Add padding if you want to offset it from the left
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1.0), // Use your desired border radius
                child: Container(
                  color: backgroundColor, // Placeholder for the podcast image
                  child: Image.asset(
                    podcast.image, // Make sure this is the correct path to your image asset.
                    width: screenWidth * 0.8, // You may adjust the width to fit your design
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.01), // Adjust the space as needed
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Text(
                podcast.name,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Adjust the space as needed
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Text(
                podcast.author,
                style: const TextStyle(
                  color: secondaryColor,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: screenHeight * 0.01), // Space before the audio controls
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Image.asset('assets/wave.png', width: screenWidth * 0.8, height: screenHeight * 0.1),
            ),
            SizedBox(height: screenHeight * 0.001), // Space before the waveform
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Image.asset('assets/time.png', width: screenWidth * 0.8, height: screenHeight * 0.05),
            ),
            SizedBox(height: screenHeight * 0.01), // Space before the waveform
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.25, right: screenWidth * 0.25),
              child: Image.asset('assets/cont.png', width: screenWidth * 0.5, height: screenHeight * 0.1),
            ),
          ],
        ),
      ),
    );
  }
}
