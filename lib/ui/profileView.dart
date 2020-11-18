import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:simppm_unh/model/userModel.dart';
import 'package:simppm_unh/provider/authProvider.dart';
import 'package:simppm_unh/services/apiServices.dart';
import 'package:simppm_unh/util/shared_preferences.dart';
import 'package:simppm_unh/util/widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final BaseUrl api = BaseUrl();
  AuthProvider authProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    // UserModel user = Provider.of<UserProvider>(context).user;
    Future<UserModel> _getUserData() async => await UserPreferences().getUser();
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    // AuthProvider auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              FutureBuilder(
                  future: _getUserData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                      // break;
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          var user = snapshot.data;
                          return boxProfile(
                              widthScreen,
                              heightScreen * 0.30,
                              user.idUsers,
                              api.url + "/imageUpload/" + user.foto,
                              user.nama,
                              user.nidn,
                              user.level);
                        }
                    }
                  }),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: heightScreen * 0.25),
              padding: EdgeInsets.all(5),
              // alignment: Alignment.center,
              width: widthScreen * 0.7,
              height: heightScreen * 0.1,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.black)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             AddJurnal(idUsers))),
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_box,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Text(
                          "Jurnal",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      authProvider.logOut();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
