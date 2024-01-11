import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselModule extends StatefulWidget {
  const CarouselModule({super.key});

  @override
  State<CarouselModule> createState() => _CarouselModule();
}

class _CarouselModule extends State<CarouselModule> {
  @override
  Widget build(BuildContext context) {
    // List<String> slideImages = [];
    return Container(
      alignment: Alignment.topLeft,
      child: CarouselSlider(
        items: [
          "https://mtv.vn/uploads/2021/08/1629456144_641_686-Hinh-Nen-Galaxy-Full-HD-Hinh-Nen-Thien-Ha.jpg",
          "https://th.bing.com/th/id/OIP._kzJWkkn5_Tb40iW6a2IlwHaEK?w=1920&h=1080&rs=1&pid=ImgDetMain",
          "https://mtv.vn/uploads/2021/08/1629456144_641_686-Hinh-Nen-Galaxy-Full-HD-Hinh-Nen-Thien-Ha.jpg"
        ].map((i) {
          return Container(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width / 2,
            margin: const EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(children: [
                Image.network(
                  "$i",
                  cacheHeight: 400,
                  cacheWidth: 400,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: RichText(
                    text: const TextSpan(
                      text: "Hand1",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "\nViet Nam, Ha Noi",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 200,
          viewportFraction: 0.5,
        ),
      ),
    );
  }
}
