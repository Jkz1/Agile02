import 'package:agile02/page/about.dart';
import 'package:agile02/page/popular.dart';
import 'package:agile02/providers/listakun.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/about_akun.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key});

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  " > About Us < ",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Mission",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Aplikasi Bagibagi.id dibuat untuk menfasilitasi pengguna internet yang ingin memberikan dukungan finansial kepada konten kreator seperti para Youtuber, Streamer, dan Podcaster",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Members",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/jokowi.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("JIKKY",
                                    style: TextStyle(color: Colors.white)),
                                Text("211110217",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/jokowi.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text("LUKMAN HAKIM",
                                    style: TextStyle(color: Colors.white)),
                                Text("211111578",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/jokowi.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("BOBBY BORIS FEBRIAN BAKARA",
                                    style: TextStyle(color: Colors.white)),
                                Text("211112299",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/jokowi.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text("M. AULIA KAHFI",
                                    style: TextStyle(color: Colors.white)),
                                Text("211112562",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )

                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Row(
                //     children: [
                //       Container(
                //         color: Colors.green,
                //         padding: const EdgeInsets.all(20.0),
                //         child: const Text(
                //           "Mission",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           color: Colors.white,
                //           padding: const EdgeInsets.all(20.0),
                //           child: Text(
                //             "Aplikasi Bagibagi.id dibuat untuk menfasilitasi pengguna internet yang ingin memberikan dukungan finansial kepada konten kreator seperti para Youtuber, Streamer, dan Podcaster",
                //             style: TextStyle(color: Colors.black),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Row(
                //     children: [
                //       Container(
                //         color: Colors.white,
                //         padding: const EdgeInsets.all(20.0),
                //         child: Text(
                //           "Members",
                //           style: TextStyle(color: Colors.black),
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           color: Colors.white,
                //           child: Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Row(
                //                   children: [
                //                     CircleAvatar(
                //                       backgroundImage:
                //                           AssetImage('assets/jokowi.jpg'),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: const [
                //                           Text("JIKKY"),
                //                           Text("211110217")
                //                         ],
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //               const Divider(height: 5),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.end,
                //                   children: [
                //                     CircleAvatar(
                //                       backgroundImage:
                //                           AssetImage('assets/jokowi.jpg'),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.end,
                //                         children: const [
                //                           Text("LUKMAN HAKIM"),
                //                           Text("211111578")
                //                         ],
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
