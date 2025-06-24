import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/cubit.dart';
import '../cubit/cubit_status.dart';
class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoaded) {
            return ListView.builder(
                itemCount: (state.products.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final firstIndex = index * 2;
                  if (firstIndex + 1 >= state.products.length) {
                    final product1 = state.products[firstIndex];
                    return Row(
                      children: [
                        Expanded(
                          child: Image.network(product1.image, fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    );
                  } else {
                    final product1 = state.products[firstIndex];
                    final product2 = state.products[firstIndex + 1];
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 280.h, // طول ثابت للكونتينر بالكامل
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0.w,
                              ),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150.h,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    child: Image.network(
                                      product1.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  product1.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "EGP: ${product1.price}",
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Review: ${product1.rarting} ✨",
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 280.h, // طول ثابت للكونتينر بالكامل
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0.w,
                              ),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150.h,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    child: Image.network(
                                      product2.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  product2.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "EGP: ${product2.price}",
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Review: ${product2.rarting} ✨",
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
