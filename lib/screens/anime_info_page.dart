import 'package:flutter/material.dart';

class AnimeInfoPage extends StatelessWidget {
  const AnimeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Look Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Look Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Introduction to the manga
              const Text(
                'Look Back is a one-shot manga by Tatsuki Fujimoto. It tells the emotional story of two young artists, '
                'Fujino and Kyomoto, and their journey through art, friendship, and self-discovery. '
                'The manga explores themes of creativity, loss, and connection, resonating deeply with its readers.',
              ),
              const SizedBox(height: 16),

              // Image of the manga cover
              Image.asset(
                  'lib/assets/images/look_back_cover.jpg'), // Replace with your image path
              const SizedBox(height: 16),

              // Additional info section
              const Text(
                'Themes and Art Style:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The manga explores themes of personal growth, isolation, and the emotional weight of artistic expression. '
                'Its art style reflects the raw emotions of the characters, using bold strokes and deep contrasts. The story pushes '
                'readers to reflect on their own lives, while immersing them in a deeply emotional narrative.',
              ),
              const SizedBox(height: 16),

              // Another image related to the manga
              Image.asset(
                  'lib/assets/images/kyomoto_art.jpg'), // Replace with your image path
              const SizedBox(height: 16),

              // Details on the creators
              const Text(
                'Creator: Tatsuki Fujimoto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tatsuki Fujimoto is a renowned manga artist, best known for creating "Chainsaw Man." Look Back showcases his '
                'ability to combine intense emotional depth with exceptional artwork. Fujimoto\'s influence in the manga world is '
                'immense, and Look Back provides an intimate glimpse into his storytelling skills and visual artistry.',
              ),
              const SizedBox(height: 16),

              // Published Date and Platform
              const Text(
                'Published: July 2021',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Look Back was published as a one-shot manga in July 2021 in Shonen Jump+. The story immediately captured the hearts '
                'of manga fans worldwide due to its raw emotional intensity and unique artistic style.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Final Image and More Information
              const Text(
                'Impact and Reception:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Since its release, Look Back has been praised for its mature storytelling and captivating artwork. It resonates with '
                'readers who have experienced emotional struggles or artistic block, providing a sense of hope and encouragement. '
                'The manga has been a major influence on many upcoming creators and has solidified Fujimoto\'s position as one of the '
                'leading manga artists of his generation.',
              ),
              const SizedBox(height: 16),

              // Another image
              Image.asset(
                  'lib/assets/images/fujimoto_artwork.jpg'), // Replace with your image path
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
