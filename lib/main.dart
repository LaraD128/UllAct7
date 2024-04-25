import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ropa leFleur* LARA 0312'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://raw.githubusercontent.com/LaraD128/img_iOS/main/golf/camisa.webp',
    'https://raw.githubusercontent.com/LaraD128/img_iOS/main/golf/gorro.webp',
    'https://raw.githubusercontent.com/LaraD128/img_iOS/main/golf/pantalon.webp',
    'https://raw.githubusercontent.com/LaraD128/img_iOS/main/golf/teni1.webp',
    'https://raw.githubusercontent.com/LaraD128/img_iOS/main/golf/teni2.webp',
    'https://raw.githubusercontent.com/LaraD128/img_iOS/main/golf/teni3.webp',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xffead76e),
      ),
      body: Container(
        color: Color(0xfffbfdf3),
        child: Center(
          child: Column(
            children: [
              CarouselSlider(
                items: imgList
                    .map((e) => Center(
                          child: Image.network(e),
                        ))
                    .toList(),
                options: CarouselOptions(
                  initialPage:
                      _currentPage, // Asegura que la página inicial sea la actual.
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentPage = index; // Actualiza la página actual.
                    });
                  },
                ),
              ),
              buildCarouselIndicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == _currentPage ? Colors.black : Colors.grey,
            ),
          )
      ],
    );
  }
}
