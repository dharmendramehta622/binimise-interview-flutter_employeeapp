part of staff;

// class attendanceResult extends StatelessWidget {
//   final attendance attendance;
//   const attendanceResult({
//     super.key,
//     required this.attendance,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 50.0),
//       child: Column(
//         children: [
//           BoldText("Confirm the results", 22, kBlack600),
//           sizedBoxHeight(14),
//           ResultChart(attendance: attendance),
//         ],
//       ),
//     );
//   }
// }

class ResultChart extends StatelessWidget {
  const ResultChart({
    super.key,
    required this.attendance,
  });

  final AttendanceModel attendance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: kGrey50, width: 1),
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), // 8% opacity
            offset: const Offset(0, 24), // X: 0, Y: 24
            blurRadius: 64, // Blur: 64
            spreadRadius: -10, // Spread: -10
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText("Attendance date and time", 14, kBlack600),
              BoldText(formatDateTime(attendance.date), 14, kTextGreen),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText("Attendance Image", 14, kBlack600),
              Image.network(
                cacheHeight: 60,
                cacheWidth: 60,
                attendance.imageUrl ?? '',
                height: 60,
                width: 60,
              )
            ],
          ),

          // ElevatedButton(onPressed: (){}, child: Text("Print"))
        ],
      ),
    );
  }
}
