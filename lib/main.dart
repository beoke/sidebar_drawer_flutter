import 'package:flutter/material.dart';

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
      "https://tse2.mm.bing.net/th?id=OIP.SP64iNxFPC5qCIwW8KtwAAHaEN&pid=Api&P=0&h=180";
  String backup;

  void gantiuser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Side Bar (DRAWER)"),
        backgroundColor: Colors.red[700],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Dhafa Bintang"),
              accountEmail: Text("dafabintang@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(gambar1),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(gambar2), fit: BoxFit.cover),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => gantiuser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://tse4.mm.bing.net/th?id=OIP.YJEXCzcyobIwNCdMMHnhoAHaEr&pid=Api&P=0&h=180"),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://tse4.mm.bing.net/th?id=OIP.YJEXCzcyobIwNCdMMHnhoAHaEr&pid=Api&P=0&h=180"),
                )
              ],
            ),
            ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
