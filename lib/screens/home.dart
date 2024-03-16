import 'package:flutter/material.dart';
import '../data/podcasts.dart';
import '../data/filters.dart';
import './podcast_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var size = MediaQuery.of(context).size;
    final double itemHeight =  screenHeight * 0.4; // Adjust for appBar height and padding
    final double itemWidth = screenWidth * 0.6;

    const Color backgroundColor = Color(0xFF1F1D2B);
    Color primaryColor = Color(0xFFFFFFFF);
    const Color secondaryColor = Color(0xFFC4C4C4);
    const Color thirdColor = Color(0xFF525298);
    const Color tabColor = Color(0xFF252836);
    const Color unselected = Color(0xFF979797);
    const Color lastColor = Color(0xFF2F3142);
    const Color lastColor2 = Color(0xFFC4C4C4);


    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1D2B),
        centerTitle: true,
        title: const Text(
          'Podkes',
          style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Image.asset('assets/icons/left.png', width: 20.0, height: 20.0),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/notif.png', width: 20.0, height: 20.0),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.5)),
                        fillColor: Colors.white.withOpacity(0.1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Padding( // Wrap the icon with Padding
                          padding: const EdgeInsets.only(right: 8.0), // Adjust the padding value as needed
                          child: Image.asset('assets/icons/search.png', width: 20.0, height: 20.0),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          maxHeight: 150,
                          maxWidth: 150,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filters.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: index == filters.length - 1 ? 8 : 0),
                          decoration: BoxDecoration(
                            color: lastColor, // Filter background color
                            borderRadius: BorderRadius.circular(36), // Adjust border radius here
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Center(
                              child: Text(
                                filters[index].name,
                                style: const TextStyle(
                                  color: lastColor2, // Adjust text color
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0), // Add padding to align the text to the left
                    child: Text(
                      'Trending',
                      textAlign: TextAlign.left, // Align text to the left
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 11,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 0.0),
                child: Align(
                  alignment: Alignment.center,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      childAspectRatio: (itemWidth / itemHeight), // Adjust the aspect ratio to fit your content
                      crossAxisSpacing: 0, // Horizontal space between items
                      mainAxisSpacing: 0, // Vertical space between items
                    ),
                    itemCount: podcasts.length,
                    itemBuilder: (context, index) {
                      final podcast = podcasts[index];
                      return Card(
                        clipBehavior: Clip.antiAlias, // Adds rounded corners to the image
                        color: backgroundColor, // Set your desired background color here
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PodcastDetailScreen(podcast: podcasts[index]),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(podcast.image, fit: BoxFit.cover), // Makes image cover the available space
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  podcast.name,
                                  style: const TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
                                  // overflow: TextOverflow.ellipsis, // Prevents text overflow
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  podcast.author,
                                  style: const TextStyle(color: lastColor2, fontSize: 10, fontFamily: "Inter"),
                                  overflow: TextOverflow.ellipsis, // Prevents text overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: tabColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: unselected,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 24.0, height: 24.0),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/library.png', width: 24.0, height: 24.0),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile.png', width: 24.0, height: 24.0),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

