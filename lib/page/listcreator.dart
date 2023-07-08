import 'package:agile02/page/about.dart';
import 'package:agile02/page/popular.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/listakun.dart';
import 'package:agile02/providers/provUtama.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/about_akun.dart';

class Listacc extends StatefulWidget {
  const Listacc({Key? key});

  @override
  _ListaccState createState() => _ListaccState();
}

class _ListaccState extends State<Listacc> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredCards = [];

  String searchinput = "";

  @override
  void initState() {
    super.initState();
    _filteredCards = Provider.of<DataProvider>(context, listen: false).users;
    Provider.of<ProvUtama>(context, listen: false).updateTotalPendapatan();
    Provider.of<ProvUtama>(context, listen: false).earlyAll();
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<ProvUtama>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchinput = value;
                    _filteredCards = dataprovider.daftarakun
                        .where((user) => user['nama']
                            .toString()
                            .toLowerCase()
                            .contains(searchinput.toLowerCase()))
                        .toList();
                  });
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Atur radius border di sini
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:
                        BorderRadius.circular(30), // Atur radius border di sini
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: "Search by Name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            if (searchinput != "")
              Container(
                width: 700,
                height: MediaQuery.of(context).size.height -
                    120, // Atur tinggi container sesuai kebutuhan
                child: Wrap(
                  children: _filteredCards.asMap().entries.map((entry) {
                    var index = entry.key;
                    var user = entry.value;
                    String name = user['nama'];
                    dynamic splitted = name.split(" ");
                    String username = user['username'];
                    String imgProfil = user['img'];
                    return InkWell(
                      onTap: () {
                        print('Card tapped: $name');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => About(username: username),
                          ),
                        );
                      },
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: AssetImage(imgProfil),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.grey.shade300,
                                width: double.infinity,
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          splitted[0],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green.shade900,
                                            fontSize: 36,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.0),
                                      Align(
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '@',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              TextSpan(
                                                text: username,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            if (searchinput == "" || searchinput == null) Popular()
          ],
        ),
      ),
    );
  }
}
