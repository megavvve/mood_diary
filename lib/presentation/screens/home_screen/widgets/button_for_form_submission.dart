import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_diary/presentation/screens/home_screen/widgets/is_form_is_full.dart';

class ButtonForFormSubmission extends StatelessWidget {
  const ButtonForFormSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      height: 44.h,
      child: ElevatedButton(
        onPressed: isFormIsFull(context)
            ? () {
                _showSuccessDialog(context);
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isFormIsFull(context) ? Colors.orange : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
        ),
        child: Text(
          'Сохранить',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Успех'),
        content: const Text('Все ок!'),
        actions: <Widget>[
          TextButton(
            child: const Text('Закрыть'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
