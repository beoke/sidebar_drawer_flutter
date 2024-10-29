import 'package:flutter/material.dart';
import 'package:sidebar_drawer_flutter/detail.dart';
import './detail.dart';

void main() {
  runApp(MaterialApp(
    title: "SIDEBAR",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar1 =
      "https://tse3.mm.bing.net/th?id=OIP.-cMa2IPG-pecMEzhVIqBEwHaFj&pid=Api&P=0&h=180";
  String gambar2 =
      "https://tse2.mm.bing.net/th?id=OIP.90olGr6sqBFTm0SyysnBTQHaEL&pid=Api&P=0&h=180";
  String backup = "";

  String nama1 = "Dhafa Bintang";
  String nama2 = "Muh Ali";
  String backupnama = "";

  void gantiuser() {
    setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Side Bar (DRAWER)",
          style: TextStyle(fontFamily: "Serif", fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(nama1),
              accountEmail: Text("dafabintang@gmail.com"),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Detail(
                            nama: nama1,
                            gambar: gambar1,
                          )));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://tse2.mm.bing.net/th?id=OIP.SP64iNxFPC5qCIwW8KtwAAHaEN&pid=Api&P=0&h=180"),
                    fit: BoxFit.cover),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => gantiuser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(gambar2),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
