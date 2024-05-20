import 'dart:math';

import 'package:air_plane/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF161E36),
        title: Text(
          "search result",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25
          ),
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D7D7),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          for (int i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10, top: 10),
                              child: ticketBuilder(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );

  }
}
