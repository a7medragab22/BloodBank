import 'package:blodbank/core/ReusableCompounds/widgets/custom_dropdown_feild.dart';
import 'package:flutter/material.dart';

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
                child: CustomDropdownField(
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
                child: CustomDropdownField(
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
