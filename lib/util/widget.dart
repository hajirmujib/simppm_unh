import 'package:flutter/material.dart';

MaterialButton longButtons(String title, Function fun, double size,
    {Color color: const Color(0xfff063057), Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: size,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

Widget boxProfile(
  double width,
  double height,
  String id,
  String foto,
  String nama,
  String nidn,
  String level,
) {
  return Container(
    width: width,
    height: height,
    color: Colors.orange,
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) =>
          //             EditAccount("4"))),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image.network(
                foto,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              )),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              nidn,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              level,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}
