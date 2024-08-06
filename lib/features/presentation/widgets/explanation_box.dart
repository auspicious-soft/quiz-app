import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplanationBox extends StatelessWidget {


  const ExplanationBox({
    super.key,
    required this.hintTxt,
    this.maxLines = 8
  });

final int maxLines;
final String hintTxt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                            width: double.infinity,
                            height: (maxLines > 8) ? 200.h : 100.h,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:   Colors.black,
                                  )),
                              child:   Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                                  textInputAction: TextInputAction.done,
    
                                  maxLines: maxLines, //or null
                                  decoration: InputDecoration.collapsed(
                                      hintText: hintTxt),
                                ),
                              ),
                            ));
  
  }
}