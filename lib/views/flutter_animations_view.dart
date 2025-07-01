import 'package:flutter/material.dart';

class FlutterAnimationsWebApp extends StatelessWidget {
  const FlutterAnimationsWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Web Animations")),
      body: const SizedBox(
        height: 300,
        child:  Row(
          children: [
            AnimationCard(title: "Fade Animation", animationWidget: FadeAnimationDemo()),
            SizedBox(width: 20,),
            AnimationCard(title: "Slide Animation", animationWidget: SlideAnimationDemo()),
          ],
        ),
      ),
    );
  }
}

class AnimationCard extends StatelessWidget {
  final String title;
  final Widget animationWidget;

  const AnimationCard({super.key, required this.title, required this.animationWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            animationWidget,
          ],
        ),
      ),
    );
  }
}

class FadeAnimationDemo extends StatefulWidget {
  const FadeAnimationDemo({super.key});
  @override
  State<FadeAnimationDemo> createState() => _FadeAnimationDemoState();
}

class _FadeAnimationDemoState extends State<FadeAnimationDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: Container(color: Colors.black, height: 120, width: 120,),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => setState(() => _visible = !_visible),
          child: const Text("Toggle Fade"),
        )
      ],
    );
  }
}

class SlideAnimationDemo extends StatefulWidget {
  const SlideAnimationDemo({super.key});
  @override
  State<SlideAnimationDemo> createState() => _SlideAnimationDemoState();
}

class _SlideAnimationDemoState extends State<SlideAnimationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _offsetAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: const FlutterLogo(size: 80),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _controller.forward(from: 0),
          child: const Text("Slide"),
        )
      ],
    );
  }
}