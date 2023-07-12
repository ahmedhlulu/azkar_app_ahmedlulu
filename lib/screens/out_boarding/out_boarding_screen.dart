import 'package:flutter/material.dart';

import '../../widgets/out_boarding_content.dart';
import '../../widgets/out_boarding_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _selectedPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int selectedPage) {
              print('Selected Page: $selectedPage');
              setState(() {
                _selectedPage = selectedPage;
              });
            },
            children: [
              const OutBoardingContent(title: 'أذكر الله'),
              const OutBoardingContent(title: 'سهولة في الإستخدام'),
              const OutBoardingContent(title: 'محتوى مفيد'),
            ],
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(
                  marginEnd: 14,
                  selected: _selectedPage == 0,
                ),
                OutBoardingIndicator(
                  marginEnd: 14,
                  selected: _selectedPage == 1,
                ),
                OutBoardingIndicator(
                  selected: _selectedPage == 2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: _selectedPage == 0
                        ? Colors.grey.shade400
                        : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: _selectedPage == 2
                        ? Colors.grey.shade400
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 30,
            child: Visibility(
              visible: _selectedPage != 2,
              replacement: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/main_screen');
                },
                child: Text('START'),
              ),
              child: TextButton(
                child: Text('SKIP'),
                onPressed: () {
                  _pageController.jumpToPage(2);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}