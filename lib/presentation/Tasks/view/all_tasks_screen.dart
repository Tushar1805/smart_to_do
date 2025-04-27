import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  var val = 1;
  @override
  Widget build(final BuildContext context) {
    setState(() {
      val = 2;
    });
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
      ),
    );
  }
}
// class AllTasksScreen extends HookWidget {
//   const AllTasksScreen({super.key});

//   @override
//   Widget build(final BuildContext context) => Scaffold(
//         body: SfCalendar(
//           view: CalendarView.timelineWeek,
//         ),
//       );
// }
