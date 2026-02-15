import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppDropdownField(
                  value: 'O+',
                  items: const [
                    'A+',
                    'A-',
                    'B-',
                    'B+',
                    'O+',
                    'O-',
                    'AB+',
                    'AB-',
                  ],
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AppDropdownField(
                  value: '50 m',
                  items: const [
                    '50 m',
                    '100 m',
                    '500 m',
                    '1 k',
                    '2 k',
                    '5 k',
                    '10 k',
                    '15 k',
                    '20 k',
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              hintText: "Enter city or ZIP code",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search_outlined, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppDropdownField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const AppDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6.h),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
