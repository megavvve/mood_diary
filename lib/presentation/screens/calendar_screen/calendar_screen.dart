import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Text(
              'Сегодня',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                return Text(
                  DateFormat.E('ru').format(DateTime(2022, 1, index + 3)),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                );
              }),
            ),
          ),
          Expanded(
            child: PagedVerticalCalendar(
              minDate: DateTime(now.year, now.month, now.day),
              maxDate: DateTime(now.year + 1, now.month, now.day),
              initialDate: now,
              invisibleMonthsThreshold: 1,
              startWeekWithSunday: false,
              monthBuilder: (context, month, year) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          year.toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.MMMM('ru').format(DateTime(year, month)),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
              dayBuilder: (context, date) {
                bool isToday = date.day == now.day &&
                    date.month == now.month &&
                    date.year == now.year;
                return Container(
                  margin: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isToday ? Colors.orange.shade100 : Colors.transparent,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        isToday
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: 17.5.w,
                                  ),
                                  Container(
                                    width: 7.w,
                                    height: 7.h,
                                    decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              },
              listPadding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ],
      ),
    );
  }
}
