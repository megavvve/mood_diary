import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_diary/presentation/providers/notes_provider.dart';
import 'package:mood_diary/presentation/providers/self_esteem_provider.dart';
import 'package:mood_diary/presentation/providers/stress_level_provider.dart';
import 'package:provider/provider.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selfEsteemProvider = Provider.of<SelfEsteemProvider>(context);
    final notesProvider = Provider.of<NotesProvider>(context);
    final stressLevelProvider = Provider.of<StressLevelProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Статистика',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Уровень самооценки: ${selfEsteemProvider.selfEsteemLevel}',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Уровень стресса: ${stressLevelProvider.stressLevel}',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Заметки: ${notesProvider.notes}',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
