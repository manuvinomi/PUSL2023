import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<Map<String, String>> _books = [
    {"name": "To Kill a Mockingbird", "description": "A novel by Harper Lee.", "quantity": "1"},
    {"name": "1984", "description": "A dystopian social science fiction novel by George Orwell.", "quantity": "1"},
    {"name": "The Great Gatsby", "description": "A novel by F. Scott Fitzgerald.", "quantity": "1"},
    {"name": "Pride and Prejudice", "description": "A romantic novel by Jane Austen.", "quantity": "1"},
    {"name": "The Catcher in the Rye", "description": "A novel by J. D. Salinger.", "quantity": "1"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Novel-Nest Cart',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _books.length,
            itemBuilder: (context, index) {
              final book = _books[index];
              return Dismissible(
                key: Key(book['name']!),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _books.removeAt(index);
                  });
                },
                child: ListTile(
                  title: Text(book['name']!),
                  subtitle: Text(book['description']!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            // Decrease quantity or remove item if it's the last one
                            if (int.parse(book['quantity']!) == 1) {
                              _books.removeAt(index);
                            } else {
                              _books[index]['quantity'] = (int.parse(book['quantity']!) - 1).toString();
                            }
                          });
                        },
                      ),
                      Text('${book['quantity'] ?? '1'}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            // Increase quantity
                            _books[index]['quantity'] = (int.parse(book['quantity'] ?? '1') + 1).toString();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          // Show more information about the book
                          _showMoreInfoDialog(book);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to the checkout confirmation page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutConfirmationPage(books: _books)),
            );
          },
          child: Text('Proceed to Checkout'),
        ),
      ],
    );
  }

  void _showMoreInfoDialog(Map<String, String> book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(book['name']!),
          content: Text(book['description']!),
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

class CheckoutConfirmationPage extends StatelessWidget {
  final List<Map<String, String>> books;

  const CheckoutConfirmationPage({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Confirmation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thank you for your purchase!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Change color to green
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Your order from Novel Nest has been successfully placed. We appreciate your business.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the home page
                  Navigator.pop(context);
                },
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Novel-Nest',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Novel-Nest'),
      ),
      body: CartView(),
    ),
  ));
}
