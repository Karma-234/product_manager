import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class IndexProductView extends StatelessWidget {
  const IndexProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Dashboard',
          style: GoogleFonts.markaziText(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        '',
                        errorBuilder: (context, error, stackTrace) => Container(
                            height: 150.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: const Icon(Icons.av_timer_sharp)),
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) =>
                                const CircularProgressIndicator.adaptive(),
                      ),
                    ),
                    Gap(8.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'This is product title',
                                style: GoogleFonts.markaziText(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  textStyle: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Text(
                                'This is product description',
                                style: GoogleFonts.karla(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  textStyle: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                          Gap(40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text.rich(
                                    const TextSpan(
                                      text: 'Cost price: ',
                                      children: [
                                        TextSpan(
                                          text: '\$1.99',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    style: GoogleFonts.karla(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Text.rich(
                                    const TextSpan(
                                      text: 'Selling price: ',
                                      children: [
                                        TextSpan(
                                          text: '\$2.99',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    style: GoogleFonts.karla(
                                      fontSize: 12.spMin,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Text.rich(
                                    const TextSpan(
                                      text: 'Quantity: ',
                                      children: [
                                        TextSpan(
                                          text: '700',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    style: GoogleFonts.karla(
                                      fontSize: 12.spMin,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                position: PopupMenuPosition.under,
                                tooltip: 'More',
                                itemBuilder: (context) => ['Delete', 'Update']
                                    .map(
                                      (e) => PopupMenuItem(
                                        child: Text(
                                          e,
                                          style: GoogleFonts.karla(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => Gap(16.h),
          itemCount: 10),
    );
  }
}
