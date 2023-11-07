import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:travel_journel/core/route/app_route.dart';
import 'package:travel_journel/view/screens/edit_profile/user_model/user_model.dart';

class EditProfileController extends GetxController{
  static final EditProfileController instance = EditProfileController._init();
  EditProfileController._init();
  Database? _database;
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();
  Uint8List? imagePhotoFile;


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

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb('travel_user.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbpath = await getDatabasesPath();
    String path = join(dbpath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE user(name TEXT, country TEXT, image BLOB)');
  }

  Future<void> insertUser() async {
    final db = await database;
    db.delete('user');
    await db.insert(
      'user',
      UserModel(name: name.text, country: country.text, image: imagePhotoFile).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value){
      Get.snackbar("Success", "Profile Update Successfully!!");
      Get.offAndToNamed(AppRoutes.bottomNavBar);
    });
  }

  Future<UserModel>? readUser() async {
    try{
      final db = await instance.database;
      final maps = await db.query("user");
      if (maps.isNotEmpty) {
        final userModel = UserModel.formMap(maps.first);
        update();
        name = name== null? TextEditingController(text: '') : TextEditingController(text: userModel.name);
        update();
        country = country== null? TextEditingController(text: '') : TextEditingController(text: userModel.country);
        update();
        imagePhotoFile = userModel.image;
        update();
        return UserModel.formMap(maps.first);
      } else {
        return UserModel.formMap(maps.first);
      }
    }catch(error){
      return UserModel(name: '', country: '', image: null);
    }
  }
}