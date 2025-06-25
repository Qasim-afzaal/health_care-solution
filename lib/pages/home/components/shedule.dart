import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:veritey/core/constants/app_colors.dart';
import 'package:veritey/core/constants/imports.dart';

class ScheduleCard extends StatelessWidget {
  final Color containerColor;
  final String name;
  final String profile;
  final String title;
  final Color borderColor;
  final String address;
  final String fromTime;
  final String iconPath;

  const ScheduleCard({
    super.key,
    required this.containerColor,
    required this.name,
    required this.profile,
    required this.borderColor,
    required this.title,
    required this.address,
    required this.fromTime,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(fromTime),
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: borderColor,
                    width: 2,
                  ),
                ),
                color: containerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7),
                          Text(
                            name,
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            title,
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.textGrey,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  address,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            profile,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Icon(Icons.error, color: Colors.red));
                            },
                          ),
                        ),
                        Positioned(
                          bottom: -12,
                          child: Container(
                            height: 29,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                iconPath,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(String time) {
    try {
      final inputFormat = DateFormat('HH:mm:ss');
      final outputFormat = DateFormat('h:mm a');
      final dateTime = inputFormat.parse(time);
      return outputFormat.format(dateTime);
    } catch (e) {
      return time;
    }
  }
}
