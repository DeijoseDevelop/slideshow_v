# slideshow_v

A simple animated slider for flutter, change dots size, color and to have the possibility to place the dots on top or leave them underneath.

## Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:

```
dependencies:
  ...
  slideshow_v: <latest_version>
```

In your library add the following import:

```
import 'package:slideshow_v/slideshow_v.dart';
```

## how to use?

Simple example:

```
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My slideshow',
      home: const MySlideshow(),
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      slides: <Widget>[
        Image.asset('assets/images/slide-1.png'),
        Image.asset('assets/images/slide-2.png'),
        Image.asset('assets/images/slide-3.png'),
        Image.asset('assets/images/slide-4.png'),
        Image.asset('assets/images/slide-5.png'),
      ],
    );
  }
}
```

You can place any type of widget inside the slider:

```
SlideShow(
  slides: <Widget>[
    Center(child: Text('Hello World')),
    Column(children: []),
    Image.asset('assets/images/slide-3.png'),
    Center(child: CircularProgressIndicator.adaptative()),
  ],
);
```

Some of its settings are:

* upPoints: **bool**
* primaryColor: **Color**
* secondaryColor: **Color**
* primaryBullet: **double**
* secondaryBullet: **double**

**upPoints:** place the dots on top or leave them underneath by default.

**primaryColor:** color of the current dot.

**secondaryColor:** color of the remaining dots.

**primaryBullet:** size of the current dot.

**secondaryBullet:** size of the remaining dots.

```
SlideShow(
    upPoints: true,
    primaryColor: Colors.red,
    secondaryColor: Colors.purple,
    primaryBullet: 20,
    secondaryBullet: 10,
    slides: <Widget>[
      Image.asset('assets/images/slide-1.png'),
        Image.asset('assets/images/slide-2.png'),
        Image.asset('assets/images/slide-3.png'),
        Image.asset('assets/images/slide-4.png'),
        Image.asset('assets/images/slide-5.png'),
    ],
);
```
