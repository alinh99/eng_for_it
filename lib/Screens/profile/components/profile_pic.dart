import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key key, this.avatarUrl, this.isSaved}) : super(key: key);
  final String avatarUrl;
  final bool isSaved;
  @override
  State<ProfilePic> createState() => ProfilePicState();
}

class ProfilePicState extends State<ProfilePic> {
  static File image;
  File imageSaved;
  XFile img;
  bool isOldImage = true;
  //connect camera
  Future updateImageProfile() async {
    img = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img != null) {
      image = File(img.path);
    }
    setState(() {
      isOldImage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: widget.avatarUrl == null
            ? CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD8DffD),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await updateImageProfile();
                          },
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xff778df8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : widget.avatarUrl != null && isOldImage == true
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.avatarUrl),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffD8DffD),
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                await updateImageProfile();
                              },
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Color(0xff778df8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : widget.avatarUrl != null && isOldImage == false
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: Image.file(image).image,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffD8DffD),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    await updateImageProfile();
                                  },
                                  child: const Icon(
                                    Icons.camera_alt_rounded,
                                    color: Color(0xff778df8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
      ),
    );
  }
}
