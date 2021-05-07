import 'package:flutter/material.dart';
// Import all the pages here

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  // All pages controller
  PageController _pageController = PageController();

  // Add pages for navigation
  // List<Widget> _screen = [Page1(), Page2(), Page3(), Page4()];


  // Selected index differentiation
  // Set index to 0
  int _selectedIndex = 0;
  // When change to another page
  _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // When item on the navigation is tapped
  _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }


  // Page view and navigation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,

        // Navigation list as children
        // children: _screen,

        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      // NAVIGATION
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _onItemTapped,
      //   type: BottomNavigationBarType.fixed,
      //   items: [

          // Duplicate this widget if you have more page
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.account_balance_wallet_outlined,
          //     color: _selectedIndex == 0 ? Colors.teal[700] : Colors.grey[400],
          //   ),
          //   title: Text("Home",
          //       style: TextStyle(
          //           color: _selectedIndex == 0
          //               ? Colors.teal[700]
          //               : Colors.grey[400])),
          // ),
        // ],
      // );
    );
  }
}
