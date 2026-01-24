import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'check_email.dart';

class CheckCode extends StatefulWidget {
  static String id = "CheckCode";

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
        title: const Text(
          "التحقق من الكود",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                '00:${_seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
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
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: hasError ? Colors.red : Colors.grey,
                          width: 2,
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
              const SizedBox(height: 10),
              Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],

            const SizedBox(height: 30),
            CustomButton(
              text: hasError ? 'إعادة الإرسال' : 'إرسال',
              onPressed: hasError ? _resendCode : _checkCode,
            ),

            const SizedBox(height: 20),
            if (!hasError)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _resendCode,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFD4B38C),
                    ),
                    child: const Text(
                      'أعد إرساله',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                  const Text(
                    'لم تستلم الكود؟ ',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
