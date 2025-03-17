import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  final String text;
  final String textOnLoading;
  final bool loading;
  final VoidCallback onClick;
  const LoadMore(
      {Key? key,
      required this.text,
      required this.onClick,
      required this.loading,
      required this.textOnLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!loading) {
          onClick();
        }
      },
      child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                loading ? textOnLoading : text,
                style: TextStyle(
                  color: const Color(0xFF005D71),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              loading
                  ? SizedBox(
                      child: CircularProgressIndicator(
                        color: Color(0xFF005D71),
                      ),
                      width: 12,
                      height: 12,
                    )
                  : SizedBox()
            ],
          )),
    );
  }
}
