import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/products/stores/categories_store/categories_store.dart';
import 'package:amimpact/core/products/views/sub_categories_view/sub_categories_view.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final model = locator<CategoriesStore>().categoriesModel;
      return Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text(
            "التصنيفات",
          ),
        ),
        body: model == null
            ? const LoadingView()
            : GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 160,
                ),
                itemCount: model.result?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final cat = model.result![index];

                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          locator<CategoriesStore>().selectCategory(cat);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SubCategoriesView(
                                      title: cat.name ?? "",),),);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16, bottom: 16,),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),),
                          child: CachedImage(
                            url: cat.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 6, horizontal: 10),
                      //     child: Text(
                      //       cat.name ?? "",
                      //       maxLines: 1,
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .kufi12BoldTextStyle
                      //           .copyWith(color: Colors.white),
                      //     ),
                      //   ),
                      // )
                    ],
                  );
                },
              ),
        // body: StaggeredGrid.countBuilder(
        //   crossAxisCount: 4,
        //   itemCount: categories.length,
        //   padding: const EdgeInsets.all(16),
        //   itemBuilder: (BuildContext context, int index) => Stack(
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           final cat = locator<CategoriesStore>().categories[index];
        //           locator<CategoriesStore>().selectCategory(cat.id);
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (_) => SubCategoriesView(title: cat.name)));
        //         },
        //         child: Container(
        //           width: double.infinity,
        //           padding: const EdgeInsets.only(
        //               top: 16, left: 16, right: 16, bottom: 40),
        //           decoration: BoxDecoration(
        //               color: Theme.of(context).primaryColor,
        //               borderRadius: BorderRadius.circular(8)),
        //           // child: CachedImage(
        //           //     url:
        //           //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxHCHy0MaklCl3aM5IHzDfoFgCWHmN1MUt1Q&usqp=CAU"),
        //           child: Image.asset(
        //             R.assetsImagesMotor,
        //             fit: BoxFit.contain,
        //           ),
        //         ),
        //       ),
        //       Align(
        //         alignment: Alignment.bottomRight,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        //           child: Text(
        //             categories[index].name,
        //             maxLines: 1,
        //             style: Theme.of(context)
        //                 .textTheme
        //                 .kufi12BoldTextStyle
        //                 .copyWith(color: Colors.white),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        //   staggeredTileBuilder: (int index) => const StaggeredTile.count(2, 1.4),
        //   mainAxisSpacing: 16,
        //   crossAxisSpacing: 16,
        // ),
      );
    },);
  }
}
