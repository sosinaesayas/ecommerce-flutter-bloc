import 'package:ecommerce/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce/common/helper/images/image_display.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/presentation/all_categories/pages/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/categories/categories_display_state.dart';
import '../../../domain/category/entity/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
          builder: (context, state) {
        if (state is CategoriesLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoriesLoaded) {
          // if (state.categories.isEmpty) {
          //   print("No categories found");
          // } else
           {
            return Column(
              children: [
                _seaAll(context),
                const SizedBox(
                  height: 20,
                ),
                _categories(state.categories),
                _text(context),
              ],
            );
          }
        }
        return Container();
      }),
    );
  }
 Widget _text(BuildContext context) {
    return Text("Abebe");
  }
  Widget _seaAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, const AllCategoriesPage());
            },
            child: const Text(
              'See All',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

 

  // Widget _categories(List<CategoryEntity> categories) {
  //   return SizedBox(
  //     height: 100,
  //     child: ListView.separated(
  //         scrollDirection: Axis.horizontal,
  //         padding: const EdgeInsets.symmetric(horizontal: 16),
  //         itemBuilder: (contetx, index) {
  //           return Column(
  //             children: [
  //               Container(
  //                 height: 60,
  //                 width: 60,
  //                 decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: Colors.white,
  //                     image: DecorationImage(
  //                         fit: BoxFit.fill,
  //                         image: NetworkImage(
  //                           ImageDisplayHelper.generateCategoryImageURL(
  //                               categories[index].image),
  //                         ))
  //                         ),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               Text(
  //                 categories[index].title,
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.w400, fontSize: 14),
  //               )
  //             ],
  //           );
  //         },
  //         separatorBuilder: (context, index) => const SizedBox(width: 15),
  //         itemCount: categories.length),
  //   );
  // }
      




// Widget _categories(List<CategoryEntity> categories) {
//   // Debug print to check if the widget is being built
//   print("Building _categories with ${categories.length} items");

//   return Container(
//     height: 100,
//     color: const Color.fromARGB(255, 208, 9, 9), // Background color for easier visibility
//     child: ListView.separated(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             // Circle Avatar for simplicity
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.blue, // Customize as needed
//               child: Text(
//                 categories[index].title.isNotEmpty
//                     ? categories[index].title[0].toUpperCase()
//                     : '?', // Fallback text
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               categories[index].title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         );
//       },
//       separatorBuilder: (context, index) => const SizedBox(width: 15),
//       itemCount: categories.length,
//     ),
//   );
// }



Widget _categories(List<CategoryEntity> categories) {
  print("Building _categories with ${categories.length} items");

  return Container(
    height: 100,
    color: const Color.fromARGB(255, 208, 9, 9), // Background color for easier visibility
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        String imageUrl = ImageDisplayHelper.generateCategoryImageURL(categories[index].image);
        print("Image URL: $imageUrl"); // Debug URL

        return Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300], // Background color while loading image
              child: imageUrl.isNotEmpty
                  ? ClipOval(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          print("Error loading image: $error");
                          return const Icon(Icons.error, color: Colors.red);
                        },
                      ),
                    )
                  : Text(
                      categories[index].title.isNotEmpty
                          ? categories[index].title[0].toUpperCase()
                          : '?', // Fallback text
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            Text(
              categories[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 15),
      itemCount: categories.length,
    ),
  );
}











}
