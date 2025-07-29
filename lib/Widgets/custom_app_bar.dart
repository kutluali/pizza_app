import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget orderWidgets;
  final bool showBackButton;
  final Widget? locationWidget;

  const CustomAppBar({
    super.key,
    required this.orderWidgets,
    this.showBackButton = true,
    this.locationWidget,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(locationWidget != null ? 130 : kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              // Top row - Location ve Notification
              Row(
                children: [
                  if (locationWidget != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " Location",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18,
                                color: Color.fromARGB(255, 198, 61, 19),
                              ),
                              SizedBox(width: 4),
                              DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                child: locationWidget!,
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.keyboard_arrow_down, size: 18),
                            ],
                          ),
                        ],
                      ),
                    ),

                  // Notification icon
                  Spacer(),
                  orderWidgets is Text
                      ? Text(
                          (orderWidgets as Text).data ?? '',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 198, 61, 19),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      : orderWidgets,
                ],
              ),

              if (locationWidget != null) SizedBox(height: 18),

              // Search field
              if (locationWidget != null)
                Container(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF8F8F8),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          print("Filter clicked");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Image.asset(
                            'images/Filter.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      hintText: "Search your favourite pizza",
                      hintStyle: TextStyle(color: Color(0xFF868686)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
