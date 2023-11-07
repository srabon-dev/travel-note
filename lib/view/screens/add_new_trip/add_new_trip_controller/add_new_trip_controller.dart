import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:image_picker/image_picker.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/service/local/sqlite_service.dart';
import 'package:travel_journel/view/screens/add_new_trip/model/add_trip_model.dart';

class AddNewTripController extends GetxController{
  SqLiteService sqLiteService;
  AddNewTripController({required this.sqLiteService});

  TextEditingController titleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  File? imagePhotoFile;
  File? imageStampFile;
  String startDate = '';
  String endDate = '';

  void openPhotoGallery() async{
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 120, maxWidth: 120);

      if(pickedFile != null){
        imagePhotoFile = File(pickedFile.path);
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
        imageStampFile = File(pickedFile.path);
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

  Future<void> saveNewTrip() async{
    sqLiteService.insertTravel(
      Travel(
          title: titleController.text.trim(),
          city: cityController.text.trim(),
          country: countryController.text.trim(),
          startDate: startDate,
          endDate: endDate,
          description: descriptionController.text.trim(),
          note: noteController.text.trim(),
          image: imagePhotoFile?.readAsBytesSync(),
          stamp: imageStampFile?.readAsBytesSync(),
          stampUrl: ''
      ),
    ).then((value){
      Get.snackbar("Successfully", "New Trip Added Successfully");
      Get.offAndToNamed(AppRoutes.bottomNavBar);
    });
  }


  /*print(imageFile);
  print(startDate);
  print(endDate);
  print(titleController);
  print(cityController);
  print(countryController);
  print(descriptionController);
  print(noteController);*/


  loc.LocationData? locationData;
  bool addressLoading = false;
  List<Placemark>? placeMark;


  Future getLocation() async{
    try{
      addressLoading = true;
      update();
      locationData = await loc.Location.instance.getLocation();
      getLocationAddress(locationData: locationData);
    }catch(error){
      addressLoading = false;
      update();
      Get.snackbar("Error", error.toString());
    }
  }

  Future getLocationAddress({required loc.LocationData? locationData}) async{
    try{
      if(locationData != null){
        try{
          placeMark = await placemarkFromCoordinates(locationData.latitude!, locationData.longitude!);
          update();
        }catch(error){
          addressLoading = false;
          update();
          Get.snackbar("Error", error.toString());
        }
      }else{
        addressLoading = false;
        update();
        Get.snackbar("Error", "Address Get Error");
      }
      addressLoading = false;
      update();
    }catch(error){
      addressLoading = false;
      update();
      Get.snackbar("Error", error.toString());
    }
  }
}