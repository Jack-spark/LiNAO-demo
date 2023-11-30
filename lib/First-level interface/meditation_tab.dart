// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by readme BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../utils.dart';
import '../widgets.dart';
import '../component/Two-column Drawer.dart';
import '../lanyajiemian.dart';

class mingxiangTab extends StatefulWidget {
  static const title = 'News';
  static const androidIcon = Icon(Icons.library_books);
  static const iosIcon = Icon(CupertinoIcons.news);

  const mingxiangTab({super.key});

  @override
  State<mingxiangTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<mingxiangTab> {
  static const _itemsLength = 20;

  late final List<Color> colors;
  late final List<String> titles;
  late final List<String> contents;

  @override
  void initState() {
    colors = getRandomColors(_itemsLength);
    titles = List.generate(_itemsLength, (index) => generateRandomHeadline());
    contents =
        List.generate(_itemsLength, (index) => lorem(paragraphs: 1, words: 24));
    super.initState();
  }

  Widget _listBuilder(BuildContext context, int index) {
    return CustomButtonGrid(
      buttonLabels: [
        '',
        '',
        '',
      ],
      buttonImagePaths: [
        'assets/b1.png',
        'assets/b2.png',
        'assets/b2.png',
      ],
      buttonDetailPages: [],
    );
  }
  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/linao.png', width: 310/ devicePixelRatio, height: 77/devicePixelRatio), // 可以设置图像的宽高
            const SizedBox(width: 8), // 适当调整图像和文本之间的间距
            const Text('正念冥想'),
            const SizedBox(width: 105),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lanyaPage()),
                );
              },
              child: Image.asset(
                'assets/lianjie.png',
                width: 134/ devicePixelRatio, // 设置宽度
                height: 134/ devicePixelRatio, // 设置高度
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: CustomButtonGrid(
          buttonLabels: [
            '',
            '',
            '',
            // Add more button labels as needed
          ],
          buttonImagePaths: [
            'assets/b1.png',
            'assets/b2.png',
            'assets/b2.png',

          ],
          buttonDetailPages: [

          ],
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: ListView.builder(
        itemCount: _itemsLength,
        itemBuilder: _listBuilder,
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
