import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_apps/common/data/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final controller = Get.put(HomeController());
final _controller = PageController(viewportFraction: 0.8);

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext contesxt) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.listSlider.length,
        controller: _controller,
        itemBuilder: (context, index) => Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              image: DecorationImage(
                  image: AssetImage('${controller.listSlider[index]}'),
                  fit: BoxFit.cover)),
        ),
      ),
    );

    //  CarouselSlider(carouselController: _controller,
    //     items: controller.listSlider
    //         .map((item) => Container(
    //               width: Get.width,
    //               child: ClipRRect(
    //                 child: Stack(children: [
    //                   Image.asset(
    //                     item,
    //                     fit: BoxFit.cover,
    //                   )
    //                 ]),
    //               ),
    //             ))
    //         .toList(),
    //     options: CarouselOptions(
    //         disableCenter: false,
    //         enableInfiniteScroll: true,
    //         aspectRatio: 1.4,
    //         onPageChanged: (index, reason) {
    //           controller.currentSlide.value = index;
    //         },
    //         autoPlay: true,
    //         autoPlayInterval: Duration(seconds: 5)));
  }
}

class SmothPage extends StatelessWidget {
  const SmothPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        onDotClicked: (index) {
          controller.currentSlide(index);
        },
        controller: _controller,
        count: controller.listSlider.length,
        effect: WormEffect(dotColor: Colors.white),
      ),
    );
  }
}
