import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_script_admin/consts/custom_snackbar.dart';
import 'package:trip_script_admin/db/pick_image.dart';


const List<String> region = <String>['Ashanti',  'Bono',  'Bono East',  'Ahafo',  'Central',  'Eastern',  'Greater Accra',  'Northern',  'Savannah',  'North East',  'Upper East',  'Upper West',  'Volta',  'Oti',  'Western',  'Western North',];
class AddNewLocation extends StatefulWidget {
  const AddNewLocation({super.key});

  @override
  State<AddNewLocation> createState() => _AddNewLocationState();
}


class _AddNewLocationState extends State<AddNewLocation> {
  bool isPicked1 = false;
  bool isPicked2 = false;
  bool isPicked3 = false;
  bool isPicked4 = false;
  bool isPicked5 = false;
  List<String> images = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController openController = TextEditingController();
  final TextEditingController closeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedRegion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add New Location',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                String imagePath = await pickImage() ?? '';
                if (imagePath == '') {
                  log('Please select an image');
                  showCustomSnackBar('Please select an image', context);
                } else {
                  images.add(imagePath);
                  isPicked1 = true;
                }
              },
              child: isPicked1
                  ? Image.network(
                      images.first,
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'images/no_image.jpg',
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 450.h,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
              ),
              children: [
                GestureDetector(
                  onTap: () async {
                    String imagePath = await pickImage() ?? '';
                    if (imagePath == '') {
                      log('Please select an image');
                      showCustomSnackBar('Please select an image', context);
                    } else {
                      setState(() {
                        images.add(imagePath);
                        isPicked2 = true;
                      });
                    }
                  },
                  child: isPicked2
                      ? Image.network(
                          images[1],
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'images/no_image.jpg',
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.fill,
                        ),
                ),
                GestureDetector(
                  onTap: () async {
                    String imagePath = await pickImage() ?? '';
                    if (imagePath == '') {
                      log('Please select an image');
                      showCustomSnackBar('Please select an image', context);
                    } else {
                      setState(() {
                        images.add(imagePath);
                        isPicked3 = true;
                      });
                    }
                  },
                  child: isPicked3
                      ? Image.network(
                          images[2],
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'images/no_image.jpg',
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.fill,
                        ),
                ),
                GestureDetector(
                  onTap: () async {
                    String imagePath = await pickImage() ?? '';
                    if (imagePath == '') {
                      log('Please select an image');
                      showCustomSnackBar('Please select an image', context);
                    } else {
                      setState(() {
                        images.add(imagePath);
                        isPicked4 = true;
                      });
                    }
                  },
                  child: isPicked4
                      ? Image.network(
                          images[4],
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'images/no_image.jpg',
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.fill,
                        ),
                ),
                GestureDetector(
                  onTap: () async {
                    String imagePath = await pickImage() ?? '';
                    if (imagePath == '') {
                      log('Please select an image');
                      showCustomSnackBar('Please select an image', context);
                    } else {
                      images.add(imagePath);
                      isPicked5 = true;
                    }
                  },
                  child: isPicked5
                      ? Image.network(
                          images[5],
                          width: 200.w,
                          height: 200.h,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'images/no_image.jpg',
                          width: 200.w,
                          height: 200.h,
                          fit: BoxFit.fill,
                        ),
                ),
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: nameController,
                  title: 'Name',
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: cityController,
                  title: 'City',
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(height: 20.h),

                //regionS
                CustomDropdown(
                  title: 'Region',
                  items: region,
                  selectedValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: ratingController,
                  title: 'Rating',
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: categoryController,
                  title: 'Category',
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(height: 20.h),
                //create a checklist for the operating days and save the selected days as a list
                //create two text fields with time pickers. one for the opening time and another for the closing time
                CustomTextField(
                  controller: descriptionController,
                  title: 'Description',
                  keyboardType: TextInputType.text,
                  maxLines: 15,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: websiteController,
                  title: 'Website',
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          //create a button to submit a new location objet with all the inputted information
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.keyboardType,
    required this.maxLines,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
});
  final String title;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}