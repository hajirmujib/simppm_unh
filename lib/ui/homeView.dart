import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simppm_unh/model/artikelModel.dart';
import 'package:simppm_unh/provider/artikelProvider.dart';
import 'package:simppm_unh/services/apiServices.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final BaseUrl api = BaseUrl();
  final list = List<ArtikelModel>();
  ArtikelProvider art = ArtikelProvider();
  @override
  Widget build(BuildContext context) {
    final ArtikelProvider artikelProvider =
        Provider.of<ArtikelProvider>(context);
    // authProvider.fetchArtikel();
    // print("Print:" + art.listArtikel[3].atk_judul);
    return Scaffold(
        // backgroundColor: Color(0xffeceff1),

        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white70,
            centerTitle: true,
            title: Text(
              "SIM LP2M STMIK NH",
              style: TextStyle(color: Colors.indigo),
            )),
        body: ChangeNotifierProvider<ArtikelProvider>.value(
          value: ArtikelProvider(),
          // create: (BuildContext context) => ArtikelProvider(),
          child: ListView.builder(
              itemCount: artikelProvider.listArtikel.length,
              itemBuilder: (context, i) {
                // final x = list[i];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    // color: Colors.green,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.orange),
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  artikelProvider.listArtikel[i].jenis,
                                  style: TextStyle(color: Colors.white),
                                )),
                            Container(
                              // width: widthS * 0.4,
                              width: 200,
                              child: Text(
                                artikelProvider.listArtikel[i].atk_judul,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 100,
                          child: Image.network(api.url +
                              "/imageUpload/" +
                              artikelProvider.listArtikel[i].atk_foto),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
