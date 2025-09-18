import 'package:flutter/material.dart';

class GridDayCalendar extends StatefulWidget {
  const GridDayCalendar({super.key});

  @override
  GridDayCalendarState createState() => GridDayCalendarState();
}

class GridDayCalendarState extends State<GridDayCalendar> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 31,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            '1',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
