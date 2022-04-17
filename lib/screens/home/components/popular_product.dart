import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twendekaziclient/model/providers_model.dart';
// import 'package:shop_app/components/product_card.dart';
// import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "Popular Providers", press: () {}),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // ...List.generate(
              //   demoProducts.length,
              //   (index) {
              //     if (demoProducts[index].isPopular)
              //       return ProductCard(product: demoProducts[index]);

              //     return SizedBox
              //         .shrink(); // here by default width and height is 0
              //   },
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 350,
                child: StreamBuilder<List<Provider>>(
                  stream: getProviders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final providers = snapshot.data!;
                      return ListView(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        children: providers.map(_topprofileCard).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        )
      ],
    );
  }

  Stream<List<Provider>> getProviders() {
    return _firebaseFirestore.collection('providers').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Provider.fromJson(doc.data())).toList());
  }

  Widget _topprofileCard(Provider provider) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient:
                  const LinearGradient(colors: [Colors.white, Colors.grey]),
              boxShadow: const [BoxShadow(color: Colors.grey)]),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: const CircleAvatar(
                          maxRadius: 30.0,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                          ))),
                  const SizedBox(width: 21),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Row(children: [
                                Text(provider.firstName,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .apply(
                                            fontWeightDelta: 2,
                                            color: Colors.black)),
                                const SizedBox(width: 5),
                                Text(provider.secondName,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .apply(
                                            fontWeightDelta: 2,
                                            color: Colors.black))
                              ])),
                              const SizedBox(width: 15),
                              GestureDetector(
                                child:
                                    const Icon(Icons.map, color: Colors.black),
                                onTap: () {},
                              )
                            ]),
                        const SizedBox(height: 10),
                        Text(provider.email,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .apply(color: Colors.black))
                      ]))
                ]),
              ])),
    );
  }
}
