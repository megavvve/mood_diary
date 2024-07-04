import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_diary/presentation/providers/home_provider.dart';
import 'package:mood_diary/presentation/screens/calendar_screen/calendar_screen.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/button_for_form_submission.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/emotion_selector_widget.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/notes_widget.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/self_esteem_slider_widget.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/statistics_widget.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/stress_level_slider_widget.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/switch_between_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/utils/app_colors.dart';
import 'package:mood_diary/utils/app_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription<DateTime> _dateTimeSubscription;
  late StreamController<DateTime> _dateTimeController;

  @override
  void initState() {
    super.initState();
    _dateTimeController = StreamController<DateTime>();
    _dateTimeController.add(DateTime.now());
    _dateTimeSubscription = Stream.periodic(const Duration(seconds: 1), (i) {
      _dateTimeController.add(DateTime.now());
      return DateTime.now();
    }).listen((dateTime) {
      _dateTimeController.add(dateTime);
    });
  }

  @override
  void dispose() {
    _dateTimeSubscription.cancel();
    _dateTimeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: backColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
            floating: true,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.grey,
                  size: 24.sp,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalendarScreen(),
                    ),
                  );
                },
              ),
              SizedBox(width: 15.w),
            ],
            title: StreamBuilder<DateTime>(
              stream: _dateTimeController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final currentDate =
                      DateFormat('d MMMM HH:mm', 'ru').format(snapshot.data!);
                  return Text(
                    currentDate,
                    style: const TextStyle(color: Colors.grey),
                  );
                } else {
                  return Text(
                    DateFormat('d MMMM HH:mm', 'ru').format(
                      DateTime.now(),
                    ),
                    style: const TextStyle(color: Colors.grey),
                  );
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  const SwitchBetweenButtonWidget(),
                  SizedBox(height: 30.h),
                  if (homeProvider.isMoodDiarySelected)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmotionSelectorWidget(),
                        SizedBox(height: 30.h),
                        textForStressLevelEsteem,
                        SizedBox(height: 20.h),
                        const StressLevelSliderWidget(),
                        SizedBox(height: 30.h),
                        textForSelfEsteem,
                        SizedBox(height: 20.h),
                        const SelfEsteemSliderWidget(),
                        SizedBox(height: 30.h),
                        textForNotes,
                        SizedBox(height: 20.h),
                        const NotesWidget(),
                        SizedBox(height: 12.h),
                        const ButtonForFormSubmission(),
                        SizedBox(height: 12.h),
                      ],
                    )
                  else
                    const StatisticsWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
