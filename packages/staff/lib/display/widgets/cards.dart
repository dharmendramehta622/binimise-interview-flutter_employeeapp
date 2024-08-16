part of staff;

class ReportCard extends StatelessWidget {
  final UsersModel users;
  const ReportCard({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.userDetail,
        extra: { "user": users}
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: boxDecoration,
        child: Column(
          children: [
            // TestTypeElement(
            //     bgColor: kBlueBg,
            //     elementColor: kBlue700,
            //     assessment: assessment),
            sizedBoxHeight(0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemiBoldText(
                    "${users.firstName} ${users.lastName}", 18, kBlack600),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // BoldText("${users.lastName}", 14, kGrey600),
                        // const DotWidget(
                        //   elementColor: kGrey600,
                        // ),
                        BoldText("${users.email} ", 14, kGrey600),
                        // const DotWidget(
                        //   elementColor: kGrey600,
                        // ),
                        // BoldText("${users.phone} kg", 14, kGrey600),
                      ],
                    ),
                    // BoldText(
                    //     formatTimestamp(assessment.updatedAt), 14, kGrey600),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class AssessmentCard extends StatelessWidget {
//   final Assessment assessment;
//   const AssessmentCard({
//     super.key,
//     required this.assessment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // context.push(Routes.newAssessment, extra: {
//         //   "applicableMeasure": assessment.applicableMeasures,
//         //   "cognitionStatus": assessment.cognitiveStatus
//         // });
//       },
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: boxDecoration,
//         child: Column(
//           children: [
//             TestTypeElement(
//               bgColor: kOrangeBg,
//               elementColor: kOrange600,
//               assessment: assessment,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TestTypeElement extends StatelessWidget {
//   final Color bgColor;
//   final Color elementColor;
//   final Assessment assessment;
//   const TestTypeElement({
//     super.key,
//     required this.bgColor,
//     required this.elementColor,
//     required this.assessment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           width: screenWidth * .7,
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           decoration: BoxDecoration(
//               color: bgColor.withOpacity(.12),
//               borderRadius: BorderRadius.circular(30)),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               BoldText("${assessment.icdo} ", 14, elementColor),
//               DotWidget(elementColor: elementColor),
//               MediumText("${assessment.applicableMeasures} ", 14, elementColor)
//             ],
//           ),
//         ),
//         SvgPicture.asset(
//           Assets.icons.circular_arrow,
//           color: elementColor,
//         )
//       ],
//     );
//   }
// }



