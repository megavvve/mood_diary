import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_diary/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

class EmotionSelectorWidget extends StatelessWidget {
  final List<String> emotions = [
    'Радость',
    'Страх',
    'Бешенство',
    'Грусть',
    'Спокойствие',
    'Сила'
  ];

  EmotionSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final selectedEmotion = homeProvider.selectedEmotion;
    final tags = homeProvider.selectedEmotion != null
        ? homeProvider.emotionTags[homeProvider.selectedEmotion!]
        : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Что чувствуешь?',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 123.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: emotions.length,
            itemBuilder: (context, index) {
              final emotion = emotions[index];
              final isSelected = selectedEmotion == emotion;

              return GestureDetector(
                onTap: () => homeProvider.selectEmotion(emotion),
                child: Container(
                  height: 118.h,
                  width: 83.w,
                  margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60.w),
                    border: isSelected
                        ? Border.all(color: Colors.orange, width: 2.w)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          _getImagePath(emotion),
                          height: 50.h,
                          width: 50.w,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          emotion,
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: isSelected ? Colors.orange : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (selectedEmotion != null && tags != null && tags.isNotEmpty) ...[
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: tags.map((tag) {
              final isSelectedTag = homeProvider.selectedTags.contains(tag);

              return GestureDetector(
                onTap: () => homeProvider.toggleTag(tag),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: isSelectedTag ? Colors.orange : Colors.white,
                    borderRadius: BorderRadius.circular(4.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelectedTag ? Colors.white : Colors.black),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  String _getImagePath(String emotion) {
    switch (emotion) {
      case 'Радость':
        return 'assets/png/smile.png';
      case 'Страх':
        return 'assets/png/scary.png';
      case 'Бешенство':
        return 'assets/png/rabies.png';
      case 'Грусть':
        return 'assets/png/sad.png';
      case 'Спокойствие':
        return 'assets/png/calm.png';
      case 'Сила':
        return 'assets/png/power.png';
      default:
        return 'assets/png/default.png';
    }
  }
}
