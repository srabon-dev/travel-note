import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';

class EditTripController extends GetxController{
  SqLiteService sqLiteService;
  EditTripController({required this.sqLiteService});

  Travel? travelList;
  bool isLoading = false;
  TextEditingController? titleController;
  TextEditingController? cityController;
  TextEditingController? countryController;
  TextEditingController? descriptionController;
  TextEditingController? noteController;
  Uint8List? imagePhotoFile;
  Uint8List? imageStampFile;
  String startDate = '';
  String endDate = '';

  Future readTravel({required int id}) async{
    isLoading = true;
    update();
    print(id);
    travelList = await SqLiteService.instance.readTravel(id);
    titleController = TextEditingController(text: travelList?.title??"");
    cityController = TextEditingController(text: travelList?.city??"");
    countryController = TextEditingController(text: travelList?.country??"");
    descriptionController = TextEditingController(text: travelList?.description??"");
    noteController = TextEditingController(text: travelList?.note??"");
    imagePhotoFile = travelList?.image;
    update();
    imageStampFile = travelList?.stamp;
    update();
    startDate = travelList?.startDate??"";
    endDate = travelList?.endDate??"";
    isLoading = false;
    update();
  }

  void openPhotoGallery() async{
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 120, maxWidth: 120);

      if(pickedFile != null){
        File imagePhoto = File(pickedFile.path);
        imagePhotoFile = imagePhoto.readAsBytesSync();
        update();
      }
    }catch(error){
      Get.snackbar("Error", "Image Pick Error");
    }
  }

  void openStampGallery() async{
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 120, maxWidth: 120);

      if(pickedFile != null){
        File imageStamp = File(pickedFile.path);
        imageStampFile = imageStamp.readAsBytesSync();
        update();
      }
    }catch(error){
      Get.snackbar("Error", "Image Pick Error");
    }
  }

  void removeStamp() async{
    try{
      imageStampFile = null;
      update();
    }catch(error){
      Get.snackbar("Error", "Remove Stamp Error");
    }
  }

  Future<void> editTrip({required int id}) async{
    sqLiteService.updateTrip(
      Travel(
          id: id,
          title: titleController?.text.trim()??"",
          city: cityController?.text.trim()??"",
          country: countryController?.text.trim()??"",
          startDate: startDate,
          endDate: endDate,
          description: descriptionController?.text.trim()??"",
          note: noteController?.text.trim()??"",
          image: imagePhotoFile,
          stamp: imageStampFile,
          stampUrl: ''
      ),
    ).then((value){
      Get.snackbar("Success", "Trip Update Successfully");
      Get.offAndToNamed(AppRoutes.bottomNavBar);
    });
  }
}