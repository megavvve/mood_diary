import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_diary/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SwitchBetweenButtonWidget extends StatelessWidget {
  const SwitchBetweenButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SizedBox(
      width: 288.w,
      child: Stack(
        children: [
          Positioned(
            left: 170.w,
            child: GestureDetector(
              onTap: () => homeProvider.toggleSelection(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: !homeProvider.isMoodDiarySelected
                      ? Colors.orange
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.w),
                  boxShadow: !homeProvider.isMoodDiarySelected
                      ? [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [],
                ),
                child: Row(
                  children: [
                    Text(
                      'Статистика',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: !homeProvider.isMoodDiarySelected
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => homeProvider.toggleSelection(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: homeProvider.isMoodDiarySelected
                    ? Colors.orange
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(20.w),
                boxShadow: homeProvider.isMoodDiarySelected
                    ? [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                'Дневник настроения',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: homeProvider.isMoodDiarySelected
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
