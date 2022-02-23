import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Bookanim(),
    );
  }
}

class Bookanim extends StatelessWidget {
  const Bookanim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Column(
        children: const [
          Flexible(child: CompletedBook()),
        ],
      ),
    );
  }
}

class CompletedBook extends StatelessWidget {
  const CompletedBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Book(
          gradient: const [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
          heightFactor: 0.48,
          widthFactor: 0.65,
          alignment: Alignment.centerRight,
          alignHeightFactor: 2.2,
          alignWidthFactor: 1.283,
          matrix4: Matrix4.identity()..rotateY(0.0),
        ),
        Book(
          gradient: const [
            Color(0xFF68240D),
            Color(0xFF271F18),
            Color.fromARGB(255, 75, 73, 73),
          ],
          heightFactor: 0.474,
          widthFactor: 0.65,
          alignment: Alignment.centerRight,
          alignHeightFactor: 2.21,
          alignWidthFactor: 1.36,
          matrix4: Matrix4.identity()..rotateY(0.0),
        ),
        Book(
          gradient: const [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
          heightFactor: 0.46,
          widthFactor: 0.65,
          alignment: Alignment.centerRight,
          alignHeightFactor: 2.2,
          alignWidthFactor: 1.325,
          matrix4: Matrix4.identity()..rotateY(0.0),
        ),
        Book(
          gradient: const [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
          heightFactor: 0.47,
          widthFactor: 0.65,
          alignment: Alignment.centerRight,
          alignHeightFactor: 2.2,
          alignWidthFactor: 1.3,
          matrix4: Matrix4.identity()..rotateY(0.0),
        ),
        Book(
          gradient: const [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
          heightFactor: 0.48,
          widthFactor: 0.65,
          alignment: Alignment.centerRight,
          alignHeightFactor: 2.2,
          alignWidthFactor: 1.283,
          matrix4: Matrix4.identity()..rotateY(0.0),
        ),
        TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 2000),
            tween: Tween(begin: 0.0, end: 2.018),
            curve: Curves.bounceIn,
            builder: (context, value, child) {
              return Book(
                gradient: const [
                  Color(0xFF271F18),
                  Color(0xFF68240D),
                ],
                heightFactor: (value < 1.5) ? 0.5 : 0.48,
                widthFactor: 0.65,
                alignment: Alignment.centerRight,
                alignHeightFactor: (value < 1.5) ? 2 : 2.3,
                alignWidthFactor: 1.28,
                matrix4: Matrix4.identity()..rotateY(value),
              );
            }),
      ],
    );
  }
}

class Book extends StatelessWidget {
  const Book(
      {Key? key,
      required this.gradient,
      required this.heightFactor,
      required this.widthFactor,
      required this.alignHeightFactor,
      required this.alignWidthFactor,
      required this.alignment,
      required this.matrix4})
      : super(key: key);

  final double widthFactor, heightFactor, alignWidthFactor, alignHeightFactor;
  final Alignment alignment;
  final List<Color> gradient;
  final Matrix4 matrix4;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      heightFactor: alignHeightFactor,
      widthFactor: alignWidthFactor,
      child: Transform(
        transform: matrix4,
        child: FractionallySizedBox(
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          child: ClipPath(
            clipper: BookPerspectiveClipper(),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Colors.black54,
                    spreadRadius: 4,
                    offset: Offset(-1.5, 1.5),
                  )
                ],
                gradient: LinearGradient(colors: gradient),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookPerspectiveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, (size.height / 100) * 11);

    path.conicTo((size.width / 100) * 85, (size.height / 100) * 5,
        (size.width / 100) * 85, (size.height / 100) * 9, 20);

    path.conicTo(
      (size.width / 100) * 85,
      (size.height / 100) * 95,
      (size.width / 100) * 83,
      (size.height / 100) * 95,
      20,
    );
    path.conicTo(
      0,
      (size.height / 100) * 90,
      0,
      (size.height / 100) * 89,
      20,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
