import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class DocumentUploadWidget extends StatelessWidget {
  final String? fileName;
  final VoidCallback onTap;
  final String documentName;
  const DocumentUploadWidget({
    super.key,
    this.fileName,
    required this.onTap,
    required this.documentName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please upload one of the document listed below",
          style: customTextStyle(
            fontStyle: FontStyle.BodyL_SemiBold,
            color: FontColor.FontPrimary,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          documentName,
          style: customTextStyle(
            fontStyle: FontStyle.HeaderXS_SemiBold,
            color: FontColor.FontPrimary,
          ),
        ),
        SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
              // Applying a border based on selection state
              border: Border.all(color: customColors().fontPrimary, width: 2.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (fileName != null)
                  Text(
                    fileName ?? "",
                    style: customTextStyle(
                      fontStyle: FontStyle.BodyL_SemiBold,
                      color: FontColor.FontPrimary,
                    ),
                  ),
                // Selection indicator icon
                if (fileName != null)
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: customColors().pacificBlue,

                      shape: BoxShape.circle,
                      border: Border.all(
                        color: customColors().pacificBlue,

                        width: 2,
                      ),
                    ),
                    child: const Icon(Icons.check, color: white, size: 14),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          "*pdf(1 mb)",
          style: customTextStyle(
            fontStyle: FontStyle.BodyM_SemiBold,
            color: FontColor.FontPrimary,
          ),
        ),
      ],
    );
  }
}
