// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by readme BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../widgets.dart';
import '../component/slider/colume_slider.dart';
import '../module/bluetooth/bluetooth_page.dart';
import 'individualMeditationCourse_page.dart';

class mingxiangTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/linao.png',
              width: 310 / devicePixelRatio,
              height: 77 / devicePixelRatio,
            ),
            const SizedBox(width: 8),
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
                width: 134 / 3.5,
                height: 134 / 3.5,
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
            // Add more image paths as needed
          ],
          buttonDetailPages: [
            LessonPage(),
            LessonPage(),
            LessonPage(),
          ],
        ),
      ),
    );
  }
}
