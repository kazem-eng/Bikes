import 'package:bike_catalog/constants/constants.dart';
import 'package:bike_catalog/theme/app_theme_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({
    required List<String> imageList,
    Key? key,
  })  : _imageList = imageList,
        super(key: key);

  final List<String> _imageList;
  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  static const _sliderMargin = 2.0;
  final _controller = CarouselController();
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: _imageSliders(),
            carouselController: _controller,
            options: CarouselOptions(
                aspectRatio: 2.0,
                disableCenter: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        _buildIndicators(),
      ],
    );
  }

  Widget _buildIndicators() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget._imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      );

  List<Widget> _imageSliders() {
    final appTheme = AppTheme.of(context).theme;
    return widget._imageList
        .map((item) => Container(
              margin: const EdgeInsets.all(_sliderMargin),
              child: ClipRRect(
                  borderRadius: appTheme.defaultBorderRadius,
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        width: 1000,
                        fit: BoxFit.cover,
                        imageUrl: item,
                        placeholder: (context, url) => Image.asset(
                          Resources.bikePlaceHolder,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
  }
}
