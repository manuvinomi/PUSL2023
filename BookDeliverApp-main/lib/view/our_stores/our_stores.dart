import 'package:flutter/material.dart';

class OurStoresView extends StatelessWidget {
  OurStoresView({Key? key}) : super(key: key);

  // Define store data with real descriptions and images
  final List<Map<String, dynamic>> stores = [
    {
      "name": "Majestic City",
      "location": "Colombo 04",
      "description":
          "Majestic City is a shopping mall located in Bambalapitiya, Colombo, Sri Lanka. It is one of the oldest malls in Colombo, offering a wide range of retail stores, food courts, and entertainment options.",
      "image": "assets/img/majestic_city.jpg",
    },
    {
      "name": "Liberty Plaza",
      "location": "Colombo 03",
      "description":
          "Liberty Plaza is a popular shopping complex situated in Kollupitiya, Colombo, Sri Lanka. It houses a variety of shops ranging from fashion and accessories to electronics and household goods.",
      "image": "assets/img/liberty_plaza.jpg",
    },
    {
      "name": "Crescat Boulevard",
      "location": "Colombo 03",
      "description":
          "Crescat Boulevard is a high-end shopping mall located in the heart of Colombo's commercial district. It features luxury boutiques, upscale dining options, and a cinema complex.",
      "image": "assets/img/crescat_boulevard.jpg",
    },
    {
      "name": "One Galle Face Mall",
      "location": "Colombo 01",
      "description":
          "One Galle Face Mall is a modern shopping destination situated in the heart of Colombo's central business district. It offers a premium shopping experience with a diverse selection of international and local brands.",
      "image": "assets/img/one_galle_face_mall.jpg",
    },
    {
      "name": "Arcade Independence Square",
      "location": "Colombo 07",
      "description":
          "Arcade Independence Square is a historic shopping precinct located in the prestigious Cinnamon Gardens area of Colombo. It features a blend of colonial architecture and contemporary design, housing a variety of shops and restaurants.",
      "image": "assets/img/arcade_independence_square.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Stores'),
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => _showStoreDetails(context, store),
              child: Card(
                elevation: 4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        store['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              store['location'],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              store['description'],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showStoreDetails(BuildContext context, Map<String, dynamic> store) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(store['name']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location: ${store['location']}'),
              SizedBox(height: 8),
              Text('Description: ${store['description']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
