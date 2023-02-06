import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_drawables.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 5,
      margin:const  EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding:EdgeInsets.all(4),child: Image.asset(AppDrawables.dummyArticle,fit:BoxFit.fitWidth,)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4),bottomRight: Radius.circular(4)),
                color: Theme.of(context).colorScheme.primary
            ),
            child: Text('Winter is Coming',textAlign:TextAlign.center,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
          ),

        ],
      ),
    );
  }
}
