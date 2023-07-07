import 'package:agile02/page/about.dart';
import 'package:agile02/page/popular.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/listakun.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 620,
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchinput = value;
                    _filteredCards = dataprovider.users
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
            if (searchinput != "")
              Container(
                width: 700,
                height: MediaQuery.of(context).size.height -
                    120, // Atur tinggi container sesuai kebutuhan
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 300 / 360,
                  padding: EdgeInsets.all(20.0),
                  mainAxisSpacing: 40.0,
                  crossAxisSpacing: 20.0,
                  children: _filteredCards.asMap().entries.map((entry) {
                    var index = entry.key;
                    var user = entry.value;
                    String name = user['nama'];
                    String username = user['username'];
                    String imgProfil = user['img_profil'];
                    String category = user['job'].join();

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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 220.0,
                                color: Colors.white,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 100.0,
                                    backgroundImage: AssetImage(imgProfil),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
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
                                            name,
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
                                        SizedBox(height: 26.0),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            category,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.red.shade800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
