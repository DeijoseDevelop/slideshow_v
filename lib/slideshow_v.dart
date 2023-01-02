import 'package:flutter/material.dart';

// slider widget creates a slider with any widget you place on the whole screen of the device
// by default, to change that wrap it in a SizedBox with fixed sizes
// it needs six params:
// 1. slides
// 2. upPoints
// 3. primaryColor
// 4. secondaryColor
// 5. primaryBullet
// 6. secondaryBullet
// it uses a _CustomProvider ( InheritedWidget )
// _CustomProvider uses your _SliderModelBLOC controller
class SlideShow extends StatelessWidget {
  const SlideShow({
    super.key,
    required this.slides,
    this.upPoints = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12,
    this.secondaryBullet = 12,
  });

  final List<Widget> slides;
  final bool upPoints;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  @override
  Widget build(BuildContext context) {
    return _CustomProvider(
      sliderModelBLOC: _SliderModelBLOC(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (BuildContext context) {
            final sliderModelBLOC = _CustomProvider.of(context).sliderModelBLOC;
            sliderModelBLOC.setPrimaryBullet(primaryBullet);
            sliderModelBLOC.setSecondaryBullet(secondaryBullet);
            return Column(
              children: <Widget>[
                if (upPoints)
                  _Dots(slides.length, primaryColor, secondaryColor),
                Expanded(
                  child: _Slides(slides),
                ),
                if (!upPoints)
                  _Dots(slides.length, primaryColor, secondaryColor),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// dynamic list of dots
class _Dots extends StatelessWidget {
  const _Dots(this.totalSlides, this.primaryColor, this.secondaryColor);
  final int totalSlides;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (int index) => _Dot(index, primaryColor, secondaryColor),
        ),
      ),
    );
  }
}

// Each circle dot to personalize
// It uses one parameteres:
// 1. index
// It uses _SliderModelBLOC controller
class _Dot extends StatelessWidget {
  const _Dot(this.index, this.primaryColor, this.secondaryColor);
  final int index;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    final sliderModelBLOC = _CustomProvider.of(context).sliderModelBLOC;
    return ValueListenableBuilder<int>(
        valueListenable: sliderModelBLOC.currentIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            width: value == index
                ? sliderModelBLOC.primaryBullet.value
                : sliderModelBLOC.secondaryBullet.value,
            height: value == index
                ? sliderModelBLOC.primaryBullet.value
                : sliderModelBLOC.secondaryBullet.value,
            decoration: BoxDecoration(
              color: value == index ? primaryColor : secondaryColor,
              shape: BoxShape.circle,
            ),
          );
        });
  }
}

// all slides
class _Slides extends StatelessWidget {
  _Slides(this.slides);
  final List<Widget> slides;

  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    final sliderModelBLOC = _CustomProvider.of(context).sliderModelBLOC;
    return PageView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      controller: pageViewController,
      onPageChanged: (int value) => sliderModelBLOC.setCurrentIndex(value),
      children: slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

// Each slide from slides
class _Slide extends StatelessWidget {
  const _Slide(this.slide);
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

// This is the provider that will manipulate
// the data through the various widgets
class _CustomProvider extends InheritedWidget {
  const _CustomProvider({
    required super.child,
    required this.sliderModelBLOC,
  });

  final _SliderModelBLOC sliderModelBLOC;

  static _CustomProvider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<_CustomProvider>()!;

  // static _CustomProvider of(BuildContext context) =>
  //     context.dependOnInheritedWidgetOfExactType<_CustomProvider>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

// This is the controller that will handle the data through the provider
class _SliderModelBLOC {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  ValueNotifier<double> primaryBullet = ValueNotifier(0.0);
  ValueNotifier<double> secondaryBullet = ValueNotifier(0.0);

  setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  setPrimaryBullet(double bullet) {
    primaryBullet.value = bullet;
  }

  setSecondaryBullet(double bullet) {
    secondaryBullet.value = bullet;
  }
}
