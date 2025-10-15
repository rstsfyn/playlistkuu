import 'package:playlistkuu/page/detail_music_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> favoriteAlbums = [
    {
      'title': 'Chesire Cat',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/en/5/5e/Blink-182_-_Cheshire_Cat_cover.jpg',
      'artist': 'Blink-182',
    },
    {
      'title': 'SIMILAR',
      'imageUrl': 'https://f4.bcbits.com/img/a2655476269_16.jpg',
      'artist': 'eleventwelfth',
    },
    {
      'title': 'Kerplunk',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/id/3/30/Kerplunk.jpg',
      'artist': 'Green Day',
    },
    {
      'title': 'Enema Of The State',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/en/thumb/a/a6/Blink-182_-_Enema_of_the_State_cover.jpg/250px-Blink-182_-_Enema_of_the_State_cover.jpg',
      'artist': 'Blink-182',
    },
    {
      'title': 'What You Dont See',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/en/1/1c/What_You_Don%27t_See_by_The_Story_So_Far_front_album_cover.jpg',
      'artist': 'The Story So Far',
    },
  ];

  final List<Map<String, String>> recommendedSongs = [
    {
      'title': 'KALA',
      'imageUrl': 'https://f4.bcbits.com/img/a2655476269_16.jpg',
      'artist': 'eleventwelfth',
      'plays': '628.223 / streams',
    },
    {
      'title': 'Bitter Sweet Symphony',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/en/0/04/The_Verve_-_Bitter_Sweet_Symphony_CD1.jpg',
      'artist': 'The Verve',
      'plays': '1.391.399.002 / streams',
    },
    {
      'title': 'Pikrian Yang Matang',
      'imageUrl':
          'https://dapurletter.id/wp-content/uploads/2025/08/perunggu.jpg',
      'artist': 'Perunggu',
      'plays': '10.352.112 / streams',
    },
    {
      'title': '2000 Light Years Away',
      'artist': 'Green Day',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/id/3/30/Kerplunk.jpg',
      'plays': '20.457.000 / streams',
    },
    {
      'title': 'Champagne Supernova',
      'artist': 'Oasis',
      'imageUrl':
          'https://images.genius.com/2f632bbfa5b2d6a9f8444a9f66744729.1000x1000x1.png',
      'plays': '521.000.345 / streams',
    },
    {
      'title': 'your head as my favourite bookstore',
      'imageUrl': 'https://f4.bcbits.com/img/a0145742385_10.jpg',
      'artist': 'eleventwelfth',
      'plays': '7.729.000 / streams',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=50',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Restu Sofyan Ma'arif",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Si Penggemar Poppunk',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 28,
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const Text(
                  'Listen Your\nFavorite Songs',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search your favorite album',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  'Favorite Albums',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favoriteAlbums.length,
                    itemBuilder: (context, index) {
                      final album = favoriteAlbums[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MusicDetailPage(
                                imageUrl: album['imageUrl']!,
                                title: album['title']!,
                                artist: album['artist']!,
                                isAlbum: true,
                              ),
                            ),
                          );
                        },
                        child: albumCard(album['imageUrl']!, album['title']!),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),
                const Text(
                  'You May Also Like This Songs',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                Column(
                  children: List.generate(recommendedSongs.length, (index) {
                    final song = recommendedSongs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                           builder: (context) => MusicDetailPage(
                              title: song['title']!,
                              artist: song['artist']!,
                              imageUrl: song['imageUrl']!,
                              isAlbum: false,
                            ),
                          ),
                        );
                      },
                      child: recommendItem(
                        image: song['imageUrl']!,
                        title: song['title']!,
                        artist: song['artist']!,
                        plays: song['plays']!,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget albumCard(String img, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              img,
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ],
      ),
    );
  }
  Widget recommendItem({
    required String image,
    required String title,
    required String artist,
    required String plays,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  artist,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  plays,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
