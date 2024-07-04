import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_diary/presentation/providers/self_esteem_provider.dart';
import 'package:provider/provider.dart';

class SelfEsteemSliderWidget extends StatelessWidget {
  const SelfEsteemSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selfEsteemProvider = Provider.of<SelfEsteemProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => Container(
                  width: 2.w,
                  height: 10.h,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 8.h,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 12.sp,
              ),
              overlayShape: SliderComponentShape.noOverlay,
              thumbColor: Colors.orange,
              overlayColor: Colors.white,
              activeTrackColor: Colors.orange,
              inactiveTrackColor: Colors.grey.shade300,
              trackShape: const RoundedRectSliderTrackShape(),
            ),
            child: Slider(
              value: selfEsteemProvider.selfEsteemLevel,
              min: 0,
              max: 10,
              onChanged: (value) {
                selfEsteemProvider.setSelfEsteemLevel(value.round().toDouble());
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Неуверенность',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Уверенность',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
