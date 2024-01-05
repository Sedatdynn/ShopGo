part of './home_view.dart';

class _EmptyDataWidget extends StatelessWidget {
  const _EmptyDataWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImagePath.shop_go.toPng(),
        Center(
          child: Text(
            "Ürün bulunamadı...",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  final HomeModel product;
  const ProductDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CachedNetworkManager.instance!
                .cachedNetworkImage(imageUrl: product.data!.productColors!.first.image.toString()),
            Positioned(
                top: 5,
                left: 0,
                child: IconButton(
                    onPressed: () => RouteManager.instance.pop(),
                    icon: const Icon(
                      Icons.arrow_left_outlined,
                      size: 32,
                    )))
          ],
        ),
        const SizedBox(height: 10),
        Card(
          child: Container(
            padding: const AppPadding.minAll(),
            decoration: const BoxDecoration(
                color: AppColors.primary, borderRadius: BorderRadiAll.lowCircular),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Icon(Icons.star_border, color: AppColors.yellow),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${product.data!.productCategory?[2]} kategorisinde',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  )
                ]),
                const SizedBox(height: 3),
                Text(
                  product.data!.productName.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '₺ ${product.data!.productSizes?.first.price.toString()}',
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.white),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return TextButton.icon(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(AppColors.white)),
                            onPressed: () {
                              if (state.selectedIndex! > 0) {
                                ToastService().showMessage(
                                    title: 'Sepete eklendi.',
                                    toastType: ToastType.info,
                                    context: context);
                              } else {
                                ToastService().showMessage(
                                    title: 'Beden seciniz!',
                                    toastType: ToastType.error,
                                    context: context);
                              }
                            },
                            icon: const Icon(Icons.shopping_basket_rounded),
                            label: const Text('Sepete ekle'));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizeWidget(
          productSizes: product.data!.productSizes!,
        )
      ],
    );
  }
}

class SizeWidget extends StatelessWidget {
  final List<ProductSizes> productSizes;
  const SizeWidget({super.key, required this.productSizes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.builder(
          padding: const AppPadding.minAll(),
          scrollDirection: Axis.horizontal,
          itemCount: productSizes.length,
          itemBuilder: (context, index) {
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () => context.read<HomeCubit>().setSelectedIndex(index),
                  child: Container(
                    width: 40,
                    padding: const AppPadding.minAll(),
                    margin: const AppPadding.minAll(),
                    decoration: BoxDecoration(
                      color: state.selectedIndex == index ? AppColors.primary : AppColors.grey,
                      borderRadius: BorderRadiAll.extremeLowCircular,
                    ),
                    child: Center(child: Text(productSizes[index].size ?? "")),
                  ),
                );
              },
            );
          }),
    );
  }
}
