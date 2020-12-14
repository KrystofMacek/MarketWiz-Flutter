import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/ui/pages/details_page.dart';
import 'package:market_wiz_flutter/ui/pages/overview_page.dart';
import 'package:market_wiz_flutter/ui/pages/portfolio_page.dart';
import 'package:market_wiz_flutter/ui/pages/watchlist_page.dart';

class MarketWizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff131e46),
        primaryColor: Color(0xff2157bf),
        primaryColorDark: Color(0xff060f2d),
        canvasColor: Color(0xff060f2d),
        accentColor: Color(0xffe0aa3e),
      ),
      // App screen will later be child of NavigationBlocProvider
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  AppScreen({Key key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  List<int> pageStack = [0];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectedPage() {
    switch (_selectedIndex) {
      case 1:
        return WatchlistPage();
        break;
      case 2:
        return PortfolioPage();
        break;
      case 3:
        return DetailsPage();
        break;
      default:
        return OverviewPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _selectedPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.public), label: 'Overview'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Watchlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.addchart_rounded), label: 'Portfolio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart), label: 'Details'),
          ],
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
