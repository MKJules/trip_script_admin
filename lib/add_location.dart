import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_script_admin/consts/custom_snackbar.dart';
import 'package:trip_script_admin/db/add_location.dart';
import 'package:trip_script_admin/db/pick_image.dart';
import 'package:trip_script_admin/models/location.dart';
import 'package:uuid/uuid.dart';

const List<String> region = <String>[
  'Ashanti',
  'Bono',
  'Bono East',
  'Ahafo',
  'Central',
  'Eastern',
  'Greater Accra',
  'Northern',
  'Savannah',
  'North East',
  'Upper East',
  'Upper West',
  'Volta',
  'Oti',
  'Western',
  'Western North',
];

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

  List<String> selectedDays = [];
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  TimeOfDay? openingTime;
  TimeOfDay? closingTime;

  void _onDaySelected(String day, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedDays.add(day);
      } else {
        selectedDays.remove(day);
      }
    });
  }

  Future<void> _selectOpeningTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        openingTime = pickedTime;
      });
    }
  }

  Future<void> _selectClosingTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        closingTime = pickedTime;
      });
    }
  }

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
                  setState(() {
                    images.add(imagePath);
                    isPicked1 = true;
                  });
                  print('Image picked');
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
                      print('Image picked');
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
                          images[3],
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
                        isPicked5 = true;
                      });
                      print('Image picked');
                    }
                  },
                  child: isPicked5
                      ? Image.network(
                          images[4],
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

                Text(
                  'Operating Days',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  children: days.map((day) {
                    return FilterChip(
                      label: Text(day),
                      selected: selectedDays.contains(day),
                      onSelected: (isSelected) =>
                          _onDaySelected(day, isSelected),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(
                          text: openingTime != null
                              ? openingTime!.format(context)
                              : '',
                        ),
                        title: 'Opening Time',
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        enabled: false,
                      ),
                    ),
                    IconButton(
                      onPressed: _selectOpeningTime,
                      icon: const Icon(Icons.access_time),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(
                          text: closingTime != null
                              ? closingTime!.format(context)
                              : '',
                        ),
                        title: 'Closing Time',
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        enabled: false,
                      ),
                    ),
                    IconButton(
                      onPressed: _selectClosingTime,
                      icon: const Icon(Icons.access_time),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: ElevatedButton(
              onPressed: () {
                try {
                  if (formKey.currentState!.validate()) {}
                  String id = const Uuid().v4();
                  String name = nameController.text;
                  String city = cityController.text;
                  double rating = double.parse(ratingController.text);
                  String category = categoryController.text;
                  String description = descriptionController.text;
                  String websiteLink = websiteController.text;

                  Location newLocation = Location(
                    id: id,
                    name: name,
                    city: city,
                    region: selectedRegion ?? '',
                    images: images,
                    rating: rating,
                    category: category,
                    operatingDays: selectedDays,
                    openingTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      openingTime!.hour,
                      openingTime!.minute,
                    ),
                    closingTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      closingTime!.hour,
                      closingTime!.minute,
                    ),
                    description: description,
                    websiteLink: websiteLink,
                  );

                  addNewLocation(newLocation);
                  showCustomSnackBar('Location added successfully', context);
                  Navigator.pop(context);
                } catch (error) {
                  log('Error: $error');
                  showCustomSnackBar('Error: $error', context);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300.w, 60.h),
                elevation: 0,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Add new location',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
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
    this.enabled = true,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  final int maxLines;
  final bool enabled;

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
          enabled: enabled, // Use the enabled property here
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
