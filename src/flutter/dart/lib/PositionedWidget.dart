/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2022 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import 'package:KDDockWidgets/View_flutter.dart';
import 'package:KDDockWidgets/View_mixin.dart';
import 'package:flutter/material.dart';

class PositionedWidget extends StatefulWidget {
  final View_mixin kddwView;

  const PositionedWidget(this.kddwView, {Key? key}) : super(key: key);

  @override
  State<PositionedWidget> createState() {
    return PositionedWidgetState(kddwView);
  }
}

class PositionedWidgetState extends State<PositionedWidget> {
  final View_mixin kddwView;
  int x = 0;
  int y = 0;
  int width = 400;
  int height = 400;
  final bool _fillsParent;

  var childWidgets = <PositionedWidget>[];

  PositionedWidgetState(this.kddwView) : _fillsParent = kddwView.m_fillsParent {
    x = kddwView.m_x;
    y = kddwView.m_y;
    width = kddwView.m_width;
    height = kddwView.m_height;
  }

  void updatePosition(int kddwX, int kddwY) {
    print("PositionedWidgetState::updatePosition()");
    setState(() {
      x = kddwX;
      y = kddwY;
    });
  }

  void updateSize(int kddwWidth, int kddwHeight) {
    print("PositionedWidgetState::updateSize()");
    setState(() {
      height = kddwHeight;
      width = kddwWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    final container = Container(
        color: Colors.red,
        child: Stack(
          children: childWidgets,
        ));

    if (_fillsParent) return container;

    return Positioned(
        width: width * 1.0,
        height: height * 1.0,
        top: y * 1.0,
        left: x * 1.0,
        child: container);
  }
}
