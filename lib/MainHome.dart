import 'package:agile02/page/about.dart';
import 'package:agile02/page/listcreator.dart';
import 'package:agile02/providers/pageProv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class UtamaHome extends StatefulWidget {
  const UtamaHome({super.key});

  @override
  State<UtamaHome> createState() => _UtamaHomeState();
}

class _UtamaHomeState extends State<UtamaHome> {
  @override
  Widget build(BuildContext context) {
    final pageprov = Provider.of<pageProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/title.png'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Color(0xff9ED447),
        currentIndex: pageprov.selectedPage,
        onTap: (value) {
          setState(() {
            pageprov.setselectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
            label: "About Us",
            icon: Icon(Icons.question_mark)
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/footer.png'),
          ),
          pageprov.selectedPage == 0
          ? Container()
          : pageprov.selectedPage == 1
            ? Listacc()
            : pageprov.selectedPage == 2
              ? Container()
              : Container()
        ],
      ),
    );;
  }
}