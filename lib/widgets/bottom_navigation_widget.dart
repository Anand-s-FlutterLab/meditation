import 'package:meditation/core/app_export.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationWidgetState();
  }
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade50, width: 0.5),
              top: const BorderSide(color: Colors.grey, width: 0.5))),
      child: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.blue.shade800,
        selectedIconTheme: const IconThemeData(size: 25),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedBottomNavigationIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Order Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            activeIcon: Icon(Icons.access_time_filled),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'More',
              tooltip: "More"),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedBottomNavigationIndex = index;
      debugPrint("Selected Index :: $selectedBottomNavigationIndex");
      _navigateToScreens(selectedBottomNavigationIndex);
    });
  }

  // This will navigate to respective pages
  void _navigateToScreens(int index) {
    if (index == 0) {
      debugPrint("Navigating to Home");
      Get.toNamed(AppRoutes.homeScreen);
    }
    else if (index == 3) {
      debugPrint("Navigating to Profile");
      Get.toNamed(AppRoutes.profileScreen);
    }
  }
}
