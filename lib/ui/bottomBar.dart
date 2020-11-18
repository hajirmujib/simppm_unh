import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simppm_unh/provider/providerBottomBar.dart';
import 'package:simppm_unh/ui/homeView.dart';
import 'package:simppm_unh/ui/infoView.dart';
import 'package:simppm_unh/ui/profileView.dart';
import 'package:simppm_unh/ui/reportView.dart';

class BottomAppBarUi extends StatefulWidget {
  @override
  _BottomAppBarUiState createState() => _BottomAppBarUiState();
}

class _BottomAppBarUiState extends State<BottomAppBarUi> {
  var currentTab = [HomeView(), InfoView(), ReportView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: provider.currentIndex == 0 ? Colors.indigo : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.announcement,
              color: provider.currentIndex == 1 ? Colors.indigo : Colors.grey,
            ),
            label: "Laporan",
            // ignore: deprecated_member_use
            // title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: provider.currentIndex == 2 ? Colors.indigo : Colors.grey,
            ),
            label: "Info",
          ),
          // ignore: deprecated_member_use
          // title: Text("Info")),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: provider.currentIndex == 3 ? Colors.indigo : Colors.grey,
            ),
            label: "Profile",
          )
          // ignore: deprecated_member_use
          // title: Text("Profile")),
        ],
      ),
    );
  }
}
