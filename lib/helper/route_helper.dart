import 'package:activity_app/MVVM/views/Show_Activities/show%20pdfs%20file/Show_pdf_viwer/pdf_viewer.dart';
import 'package:activity_app/MVVM/views/Show_Activities/show%20pdfs%20file/show_pdf.dart';
import 'package:activity_app/MVVM/views/Show_Activities/show_activities_tab.dart';
import 'package:activity_app/MVVM/views/Show_Activities/show_text_images/show_text_image.dart';
import 'package:activity_app/MVVM/views/Show_Activities/showtext/show_text.dart';
import 'package:activity_app/MVVM/views/Upload_Activity/UploadText/upload_text.dart';
import 'package:activity_app/MVVM/views/Upload_Activity/upload_avtivity_tabs.dart';
import 'package:activity_app/MVVM/views/Upload_Activity/upload_images_pdfs/file_picker.dart';
import 'package:activity_app/MVVM/views/Upload_Activity/upload_text_with_image/upload_text_image.dart';
import 'package:activity_app/MVVM/views/Upload_Activity/upload_text_with_pdf/upload_text_pdf.dart';
import 'package:activity_app/MVVM/views/homepage/home.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static const initial = "/";
  static const uploadActivities = "/uploadActivities";
  static const showActivities = "/showActivities";
  static const uploadtext = "/uploadtext";
  static const showText = "/showtext";
  static const uploadUserInfo = "/uploadUserInfo";
  static const showUserInfo = "/showUserInfo";
  static const uploadFiles = "/uploadFiles";
  static const showPdfs = "/showPdfs";
  static const showPdfsView = "/showPdfsView";
  static const pickfile = "/pickfile";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const HomeScreen(),
    uploadActivities: (context) => const UploadActivities(),
    showActivities: (context) => const ShowActivities(),
    uploadtext: (context) => const UploaText(),
    showText: (context) => const ShowText(),
    uploadUserInfo: (context) => const UploadUsers(),
    showUserInfo: (context) => const ShowUser(),
    uploadFiles: (context) => const UploadFiles(),
    showPdfs: (context) => const ShowPDFs(),
    showPdfsView: (context) => const ShowPdfViwerScreen(),
    pickfile: (context) => const UploadFileScreen(),
  };
}
