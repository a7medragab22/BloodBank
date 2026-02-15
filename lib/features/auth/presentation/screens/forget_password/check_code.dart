import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'check_email.dart';

class CheckCode extends StatefulWidget {
  const CheckCode({super.key});

  @override
  State<CheckCode> createState() => _CheckCodeState();
}

class _CheckCodeState extends State<CheckCode> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  int _seconds = 60;
  late final ticker;
  String? errorText;

  @override
  void initState() {
    super.initState();
    ticker = Stream.periodic(const Duration(seconds: 1), (x) => x).listen((_) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        ticker.cancel();
      }
    });
  }

  @override
  void dispose() {
    ticker.cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _checkCode() {
    String code = _controllers.map((c) => c.text).join();
    const correctCode = '1234';
    if (code == correctCode) {
      setState(() {
        errorText = null;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CheckEmail()),
      );
    } else {
      setState(() {
        errorText = 'كود خاطئ! من فضلك حاول مرة أخرى';
      });
    }
  }

  void _resendCode() {
    print('  تم إعادة إرسال الكود');
    setState(() {
      errorText = null;
      _seconds = 60;
      for (var c in _controllers) {
        c.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = errorText != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "التحقق من الكود",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: 20.h),
            Center(
              child: Text(
                '00:${_seconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
             SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60.w,
                  child: TextField(
                    controller: _controllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: hasError ? Colors.red : Colors.grey,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: hasError ? Colors.red : Colors.grey,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                );
              }),
            ),

            if (hasError) ...[
               SizedBox(height: 10.h),
              Text(
                errorText!,
                style: TextStyle(color: Colors.red, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ],

             SizedBox(height: 30.h),
            CustomButton(
              text: hasError ? 'إعادة الإرسال' : 'إرسال',
              onPressed: hasError ? _resendCode : _checkCode,
            ),

             SizedBox(height: 20.h),
            if (!hasError)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _resendCode,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFD4B38C),
                    ),
                    child:  Text(
                      'أعد إرساله',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                   Text(
                    'لم تستلم الكود؟ ',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
