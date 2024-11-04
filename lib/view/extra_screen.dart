// Row(
// children: [
// InkWell(
// onTap: quantity > 1
// ? () {
// cartProvider
//     .removeFromCart(product);
// }
//     : null,
// child: Container(
// height: 39,
// width: 40,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(16),
// border: Border.all(
// color: const Color(0xffE2E2E2),
// ),
// ),
// child: Image.asset(
// "assets/images/minus_in_container.png",
// height: 5,
// width: 5,
// color: quantity > 1
// ? TColor.primary
//     : const Color(0xffB3B3B3),
// ),
// ),
// ),
// const SizedBox(width: 15),
// Text(
// quantity.toString(),
// style: TextStyle(
// color: TColor.primaryText,
// fontSize: screenWidth * 0.06,
// ),
// ),
// const SizedBox(width: 15),
// InkWell(
// onTap: () {
// cartProvider.addToCart(product);
// },
// child: Container(
// height: 39,
// width: 40,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(16),
// border:  Border.all(
// color: const Color(0xffE2E2E2),
// ),
// ),
// child: Image.asset(
// "assets/images/plus_in_container.png",
// height: 5,
// width: 5,
// ),
// ),
// ),
// const SizedBox(width: 80),
// Text(
// '\$${(product.price * quantity).toStringAsFixed(1)}',
// style: TextStyle(
// color: TColor.primaryText,
// fontSize: screenWidth * 0.05,
// fontWeight: FontWeight.w600,
// ),
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
