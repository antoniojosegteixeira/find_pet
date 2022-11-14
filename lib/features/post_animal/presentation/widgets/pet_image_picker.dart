import 'dart:io';

import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class PetImagePicker extends StatefulWidget {
  const PetImagePicker({Key? key}) : super(key: key);

  @override
  State<PetImagePicker> createState() => _PetImagePickerState();
}

class _PetImagePickerState extends State<PetImagePicker> {
  final PostAnimalBloc bloc = Modular.get<PostAnimalBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<PostAnimalBloc, PostAnimalState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              final images = await _getFromGallery();

              if (images != null) {
                bloc.imageFiles = [...bloc.imageFiles, images];
                setState(() {});
              }
            },
            child: bloc.imageFiles.isEmpty
                ? PickerBox(
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: AppColors.colorDarkBlue_900,
                      ),
                    ),
                  )
                : PickerBox(
                    child: GridView.builder(
                      itemCount: bloc.imageFiles.length,
                      padding: const EdgeInsets.all(3),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                      ),
                      itemBuilder: ((context, index) {
                        return ImageCard(
                          image: bloc.imageFiles[index],
                          removeImage: () {
                            bloc.imageFiles.removeWhere((element) =>
                                element.path == bloc.imageFiles[index].path);
                            setState(() {});
                          },
                        );
                      }),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

_getFromGallery() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
}

class PickerBox extends StatelessWidget {
  const PickerBox({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.colorNeutral_50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class ImageCard extends StatelessWidget {
  ImageCard({
    Key? key,
    required this.image,
    required this.removeImage,
  }) : super(key: key);

  final PostAnimalBloc bloc = Modular.get<PostAnimalBloc>();
  final File image;
  final Function removeImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<PostAnimalBloc, PostAnimalState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  width: 30,
                  height: 30,
                  top: 3,
                  right: 3,
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      removeImage();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: AppColors.colorNeutral_0,
                    child: Icon(
                      Icons.close,
                      color: AppColors.colorNeutral_900,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
