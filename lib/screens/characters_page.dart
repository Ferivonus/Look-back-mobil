import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            CharacterCard(
              name: 'Ayumu Fujino',
              description:
                  'A young manga artist struggling with her pride and insecurities. Her journey reflects her growth as both an artist and a person.',
              imagePath: 'lib/assets/images/fujino.jpg', // Corrected image path
            ),
            CharacterCard(
              name: 'Kyomoto',
              description:
                  'An introverted and talented artist. Her bond with Fujino becomes a driving force in the story.',
              imagePath:
                  'lib/assets/images/kyomoto.jpg', // Corrected image path
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  const CharacterCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detailed character page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailPage(
              name: name,
              description: description,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Character Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              // Character Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterDetailPage extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  const CharacterDetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  String getBackgroundInfo(String characterName) {
    if (characterName == 'Ayumu Fujino') {
      return '''
Ayumu Fujino is the main protagonist of the "Look Back" one-shot manga and 2024 movie adaptation. Initially a confident young artist with a passion for manga, her world is turned upside down when a classmate’s comic surpasses her artistic abilities. Struggling with pride and insecurity, Ayumu becomes determined to improve and surpass her rival, Kyomoto. Their relationship transforms from rivalry to deep friendship, as Ayumu helps Kyomoto overcome social anxiety, and they work together on manga. However, Ayumu's journey is marked by personal growth, self-doubt, and an overwhelming need for validation.
      ''';
    } else if (characterName == 'Kyomoto') {
      return '''
Kyomoto is a quiet, introverted character who also possesses remarkable artistic talent. Her artistic work surpasses that of her classmate, Ayumu Fujino, which sets the stage for their intense rivalry. However, as the story progresses, Kyomoto's relationship with Ayumu evolves into a meaningful and supportive friendship. Kyomoto struggles with social anxiety and isolation but begins to open up through her bond with Ayumu.
      ''';
    } else {
      return 'No background information available.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              'Description:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            // Background Info
            Text(
              'Background Info:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              getBackgroundInfo(name),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
