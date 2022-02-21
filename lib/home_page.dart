import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final ScrollController _scrollController = ScrollController();

  List colors = [
    0xff2A9DDE,
    0xff4BC056,
    0xff444AD9,
    0xffBAB058,
    0xff444AD9,
    0xffC4C4C4,
    0xff2A9DDE,
    0xff4BC056,
    0xff444AD9,
    0xffC4C4C4
  ];

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(microseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Flutter Test',
              style: TextStyle(
                  fontFamily: 'Avenir Next',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  color: Colors.black),
            ),
            backgroundColor: Colors.white,
            //centerTitle: true,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vertical List Header',
                    style: TextStyle(
                      fontFamily: 'Avenir Next',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 215,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              width: 309,
                              height: 62,
                              decoration: BoxDecoration(
                                color: Color(colors[index]),
                              ));
                        }),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text(
                    'Horizontal List Header',
                    style: TextStyle(
                      fontFamily: 'Avenir Next',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 14),
                              width: 100,
                              height: 39,
                              decoration: BoxDecoration(
                                  color: const Color(0xffC4C4C4),
                                  borderRadius: BorderRadius.circular(10)));
                        }),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Text(
                    'Vertical List Header',
                    style: TextStyle(
                      fontFamily: 'Avenir Next',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: ListView.builder(
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              width: 309,
                              height: 62,
                              decoration: BoxDecoration(
                                color: Color(colors[index]),
                              ));
                        }),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: _scrollToTop,
            child: Container(
              width: 360,
              height: 54,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, -2),
                      blurRadius: 4)
                ],
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: const Center(
                child: Text(
                  'Scroll To Top',
                  style: TextStyle(
                    fontFamily: 'Avenir Next',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          )),
    );
  }}