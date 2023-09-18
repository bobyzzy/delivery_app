import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:food_delivery_app/config/config.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FoodGridItem extends StatefulWidget {
  FoodGridItem({super.key, required this.model});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
  List<FoodModel> model;
}

class _FoodGridItemState extends State<FoodGridItem> {
  @override
  Widget build(BuildContext context) {
    final data = context.read<ManagerFoodModel>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final model = widget.model;

    return GridView.builder(
      itemCount: model.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 5),
          child: InkWell(
            onTap: () {
              // ignore: inference_failure_on_function_invocation
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      width: width * 0.9,
                      height: height * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.8,
                            height: 300,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(248, 247, 245, 1),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(model[index].imageUrl))),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 50,
                                  top: 10,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.favorite_border_outlined)),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.cancel_outlined)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            model[index].title,
                            style: const TextStyle(
                              fontFamily: "SF",
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                                text: "${model[index].price} ₽",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                children: [
                                  TextSpan(
                                    text: " · ${model[index].gram}г",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  )
                                ]),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                              child: Text(
                            model[index].subtitle,
                            style: Config.lightTextTheme.displaySmall!
                                .copyWith(fontSize: 18),
                          )),
                          CustomButton(
                            textButton: 'Добавить в корзину',
                            onPressed: () {
                              data.addItem(model[index]);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 245, 244, 1),
                  ),
                  child: Image.network(
                    widget.model[index].imageUrl,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.model[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'SF',
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
