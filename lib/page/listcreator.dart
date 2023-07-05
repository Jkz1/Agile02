import 'package:agile02/page/popular.dart';
import 'package:agile02/providers/listakun.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listacc extends StatefulWidget {
  const Listacc({Key? key});

  @override
  _ListaccState createState() => _ListaccState();
}

class _ListaccState extends State<Listacc> {
  TextEditingController _searchController = TextEditingController();
  List<MyCard> _filteredCards = [];

  String searchinput = "";

  @override
  void initState() {
    super.initState();
    // Mengisi _filteredCards dengan semua kartu saat ini
    _filteredCards = Provider.of<MyCardProvider>(context, listen: false).cards;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyCardProvider>(
      builder: (context, cardProvider, _) {
        var cards = cardProvider.cards;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 620,
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchinput = value;
                          print(searchinput);
                          
                          // Mengupdate _filteredCards berdasarkan pencarian
                          _filteredCards = cards
                              .where((card) => card.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Atur radius border di sini
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(
                              30), // Atur radius border di sini
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
                  if(searchinput != "")Container(
                    width: 700,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 300 / 360,
                      padding: EdgeInsets.all(20.0),
                      mainAxisSpacing: 40.0,
                      crossAxisSpacing: 20.0,
                      children: _filteredCards.map((card) {
                        return InkWell(
                          onTap: () {
                            print('Card tapped: ${card.name}');
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
                                        backgroundImage:
                                            AssetImage(card.imagePath),
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
                                                card.name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.green.shade900,
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
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    TextSpan(
                                                      text: card.username,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 26.0),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                card.category,
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
                  if(searchinput == "" || searchinput == null) Popular()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
