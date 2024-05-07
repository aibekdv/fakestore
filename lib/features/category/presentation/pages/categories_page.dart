import 'package:fakestore/features/category/presentation/pages/category_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Категория')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryPage()),
                );
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://media.admagazine.ru/photos/6140a6f2d0129c8818c94819/master/w_1600%2Cc_limit/800x887_Quality97_016.jpg',
                          ),
                          fit: BoxFit.cover),
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "Название $index",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
