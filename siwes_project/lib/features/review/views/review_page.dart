import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewPage  extends ConsumerWidget {
  const ReviewPage ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      appBar: AppBar(title:const Text('Review'), automaticallyImplyLeading: false,),
    );
  }
}