import 'package:blodbank/core/ReusableCompounds/widgets/custom_second_button.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/cubits/bloodRequest/blood_request_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/models/blood_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodRequestSheet extends StatefulWidget {
  const BloodRequestSheet({super.key});

  @override
  State<BloodRequestSheet> createState() => _BloodRequestSheetState();
}

class _BloodRequestSheetState extends State<BloodRequestSheet> {
  final _formKey = GlobalKey<FormState>();

  final patientController = TextEditingController();
  final unitsController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

  String? bloodType = 'A+';
  String urgencyLevel = "Routine";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocConsumer<BloodRequestCubit, BloodRequestState>(
          listener: (context, state) {
            if (state is BloodRequestSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Success'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Blood Request",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    _buildTextField("Patient Name", patientController),

                    /// Blood Type + Units
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(
                            hint: "Blood Type",
                            value: bloodType,
                            items: [
                              "A+",
                              "A-",
                              "B+",
                              "B-",
                              "O+",
                              "O-",
                              "AB+",
                              "AB-",
                            ],
                            onChanged: (v) {
                              setState(() {
                                bloodType = v;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: _buildTextField(
                            "Units Needed",
                            unitsController,
                            isNumber: true,
                          ),
                        ),
                      ],
                    ),

                    /// Urgency
                    _buildDropdown(
                      hint: "Urgency Level",
                      value: urgencyLevel,
                      items: const ["Routine", "Urgent", "Critical"],
                      onChanged: (v) {
                        setState(() {
                          urgencyLevel = v!;
                        });
                      },
                    ),

                    _buildTextField("Location", locationController),

                    _buildTextField(
                      "Contact Phone",
                      phoneController,
                      isNumber: true,
                    ),

                    _buildTextField(
                      "Description",
                      descriptionController,
                      maxLines: 3,
                    ),

                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        Expanded(
                          child: CustomSecondButton(
                            text: 'Cancel',
                            backgroundColor: Colors.grey.shade300,
                            textColor: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomSecondButton(
                            text: 'confirm',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final model = BloodRequestModel(
                                  patientName: patientController.text,
                                  bloodType: bloodType!,
                                  unitsNeeded: int.parse(unitsController.text),
                                  urgencyLevel: urgencyLevel,

                                  location: locationController.text,

                                  contactPhone: phoneController.text,
                                  description: descriptionController.text,
                                );

                                context.read<BloodRequestCubit>().submitRequest(
                                  model,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : null,
        maxLines: maxLines,
        validator: (v) => v!.isEmpty ? "Required field" : null,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
