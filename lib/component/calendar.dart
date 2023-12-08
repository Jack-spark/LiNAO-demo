// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // CalendarController _calendarController;

  // @override
  // void initState() {
  //   super.initState();
  //   _calendarController = CalendarController();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        // 改选中日期的颜色，还没改完
        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (BuildContext context, DateTime focusedDay) {
            // 在这里构建你的自定义标题
            return Center(
              child: Text(
                '${focusedDay.year}-${focusedDay.month}',
                style: TextStyle(
                  fontSize: 69 / 3.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        // 改2023-12
        headerStyle: HeaderStyle(
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Color(0xFF999999),
            size: 24,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Color(0xFF999999),
            size: 24,
          ),
          formatButtonVisible: false,
          titleCentered: false,
        ),
        // 左右箭头的颜色
        locale: 'zh_CN',
        firstDay: DateTime.utc(2010, 10, 16),
        //起始时间
        lastDay: DateTime.utc(2030, 3, 14),
        //终止时间
        startingDayOfWeek: StartingDayOfWeek.monday,
        //周一为起始
        weekendDays: [DateTime.sunday],
        //周末
        focusedDay: _focusedDay,
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
