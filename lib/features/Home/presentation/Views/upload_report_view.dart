import 'dart:io';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadReportView extends StatefulWidget {
  const UploadReportView({super.key});

  @override
  State<UploadReportView> createState() => _UploadReportViewState();
}

class _UploadReportViewState extends State<UploadReportView> {
  String? _selectedFileName;
  File? _selectedFile;
  bool _isUploading = false;

  // Local state for Blood Test Request status (Pending, Approved, Rejected)
  String? _requestStatus;
  bool _isCreatingRequest = false;

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
          _selectedFileName = result.files.single.name;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking file: $e')));
    }
  }

  Future<void> _uploadReport() async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a document first!')),
      );
      return;
    }

    setState(() => _isUploading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isUploading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Report uploaded successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _createReviewRequest() async {
    setState(() => _isCreatingRequest = true);

    // Simulate sending request to Admin Review Queue
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      _isCreatingRequest = false;
      _requestStatus = 'Pending';
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Blood Test Request sent to Admin Review Queue!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xFF2D3142),
          ),
        ),
        title: Text(
          'Verification Center',
          style: TextStyle(
            color: const Color(0xFF2D3142),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Upload Blood Test Card
            _buildUploadCard(),
            
            SizedBox(height: 24.h),
            
            // Section 2: Don't Have a Blood Test? Card
            _buildNoReportCard(),

            // Section 3: Simulated Admin Review Queue (Visible when request exists)
            if (_requestStatus != null) ...[
              SizedBox(height: 24.h),
              _buildAdminSimulationPanel(),
            ],
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECEF),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColor.kSecondaryColor,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload Blood Test Report',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'For users who have a report',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Upload your blood analysis report to become a verified donor.',
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          SizedBox(height: 20.h),
          
          // Picker Area
          GestureDetector(
            onTap: _pickDocument,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: _selectedFile != null
                      ? AppColor.kSecondaryColor
                      : const Color(0xFFE5E7EB),
                  width: _selectedFile != null ? 1.5 : 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    _selectedFile != null ? Icons.check_circle : Icons.insert_drive_file_outlined,
                    size: 36.sp,
                    color: _selectedFile != null ? Colors.green : Colors.grey[400],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    _selectedFileName ?? 'Select PDF or Image file',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: _selectedFile != null ? Colors.black87 : Colors.grey[600],
                    ),
                  ),
                  if (_selectedFile != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      'Tap to change file',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColor.kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Upload Button
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: _isUploading ? null : _uploadReport,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 0,
              ),
              child: _isUploading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : Text(
                      'Upload Blood Test',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoReportCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.info_outline,
                  color: Colors.orange[700],
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Don't have a blood test?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Request review & verification',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'To become a verified donor, you must first complete a blood analysis at a hospital or laboratory. After receiving your results, you can upload them or request verification through the system.',
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          SizedBox(height: 20.h),

          // Status Badge if request exists
          if (_requestStatus != null) ...[
            _buildStatusBadge(),
            SizedBox(height: 16.h),
          ],

          // Request Button
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: _isCreatingRequest || _requestStatus != null ? null : _createReviewRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: _requestStatus != null ? Colors.grey[300] : const Color(0xFF1E293B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 0,
              ),
              child: _isCreatingRequest
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : Text(
                      _requestStatus != null ? 'Review Requested' : 'Request Blood Test Review',
                      style: TextStyle(
                        color: _requestStatus != null ? Colors.grey[600] : Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    Color textColor;
    String textLabel;

    switch (_requestStatus) {
      case 'Pending':
        bgColor = const Color(0xFFFFF7ED);
        textColor = Colors.orange[800]!;
        textLabel = 'Pending Review';
        break;
      case 'Approved':
        bgColor = const Color(0xFFF0FDF4);
        textColor = Colors.green[800]!;
        textLabel = 'Approved';
        break;
      case 'Rejected':
        bgColor = const Color(0xFFFEF2F2);
        textColor = Colors.red[800]!;
        textLabel = 'Rejected';
        break;
      default:
        bgColor = Colors.grey[100]!;
        textColor = Colors.grey[700]!;
        textLabel = 'Unknown';
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'Request Status: $textLabel',
            style: TextStyle(
              color: textColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminSimulationPanel() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SIMULATED ADMIN PANEL',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF64748B),
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Change the review state to test status badge colors:',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF334155),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _requestStatus = 'Approved';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Approve',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _requestStatus = 'Rejected';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _requestStatus = null;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF94A3B8)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Reset',
                      style: TextStyle(color: const Color(0xFF475569), fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}