import 'package:flutter/material.dart';

class MockupScreenTwo extends StatelessWidget {
  const MockupScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic> args = 
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? 
        {'title': 'Movie', 'imagePath': 'assets/images/movie.jpeg'};
    
    final String title = args['title'] ?? 'Movie';
    final String imagePath = args['imagePath'] ?? 'assets/images/movie.jpeg';
    
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A40),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section with movie poster
            Stack(
              children: [
                // Main image
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                // Gradient overlay
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        // ignore: deprecated_member_use
                        const Color(0xFF1A1A40).withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                // Back button
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                // TMDB logo
                Positioned(
                  top: 40,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00B4D8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'TMDB',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Movie title and genre info
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Text(
                            'Action • Adventure • Comedy • Fantasy',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // What's Popular Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "What's Popular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Horizontal scrolling movie list
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildPopularMovieItem('assets/images/jigra.jpeg', 7.2),
                  _buildPopularMovieItem('assets/images/captain.jpeg', 8.5),
                  _buildPopularMovieItem('assets/images/movie.jpeg', 7.9),
                  _buildPopularMovieItem('assets/images/family.jpeg', 6.8),
                ],
              ),
            ),
            
            // Synopsis
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Synopsis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'When four teenagers discover an old video game console and are drawn into the game',                   style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            
            // Cast Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Cast list
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCastItem('Actor 1', 'Character 1'),
                  _buildCastItem('Actor 2', 'Character 2'),
                  _buildCastItem('Actor 3', 'Character 3'),
                  _buildCastItem('Actor 4', 'Character 4'),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularMovieItem(String imagePath, double rating) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                rating.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCastItem(String actorName, String characterName) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          // Circular avatar
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 8),
          // Actor name
          Text(
            actorName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Character name
          Text(
            characterName,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}