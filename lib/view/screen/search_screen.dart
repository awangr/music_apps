import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_apps/common/style/app_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Explore',
                style: TextStyle(color: white),
              ),
              SizedBox(width: 10),
              Icon(Icons.explore, color: white)
            ],
          ),
          backgroundColor: transparant),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: grey.withOpacity(0.6),
                            labelText: 'Search..',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'CATEGORY',
              style: TextStyle(color: white),
            ),
            SizedBox(height: 15),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: orange, borderRadius: BorderRadius.circular(20)),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
