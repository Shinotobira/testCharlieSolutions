import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomProfilePage extends StatefulWidget {
  const RandomProfilePage({super.key});

  @override
  State<RandomProfilePage> createState() => _RandomProfilePageState();
}

class _RandomProfilePageState extends State<RandomProfilePage>
    with SingleTickerProviderStateMixin {
  List<String> phrases = [
    "Requête a ChatGPT...",
    "Requête a Bard...",
    "Verification des photos sur Dall-e...",
    "Grace a une IA avancé voici le meilleur alternant trouver !"
  ];
  int currentIndex = 0;
  String currentText = '';
  late AnimationController _animationController;
  bool transitionCompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation();
    });
  }

  void startAnimation() {
    currentIndex = 0;
    currentText = '';
    animateText();
  }

  void animateText() {
    // les "if (!mounted) return;" permettent la vérification de l'état du widget
    if (!mounted) return;

    if (currentIndex < phrases.length) {
      final phrase = phrases[currentIndex];
      final characters = phrase.split('');

      for (var i = 0; i < characters.length; i++) {
        if (!mounted) return;

        Future.delayed(const Duration(milliseconds: 50) * i, () {
          if (!mounted) return;

          setState(() {
            currentText += characters[i];
          });
          if (i == characters.length - 1) {
            Future.delayed(const Duration(seconds: 2), () {
              if (!mounted) return;

              setState(() {
                currentIndex++;
                currentText = '';
              });
              if (currentIndex < phrases.length) {
                animateText();
              } else {
                if (mounted && !transitionCompleted) {
                  transitionCompleted = true;
                  context.pushNamed('best_profile');
                }
              }
            });
          }
        });
      }
    }
  }

  @override
  void deactivate() {
    _animationController.reset();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('RandomProfile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.002),
        child: Center(
          child: Text(
            currentText,
            style: TextStyle(fontSize: screenHeight * 0.022),
          ),
        ),
      ),
    );
  }
}
