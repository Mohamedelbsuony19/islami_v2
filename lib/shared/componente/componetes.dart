import 'package:flutter/material.dart';
import 'package:islami_app/modules/quraan/quran_screen.dart';
import 'package:islami_app/modules/quraan/soura_details/soura_details.dart';

Widget defaultFromFaild({
  required TextEditingController controller,
  required TextInputType type,
  dynamic onSubmit,
  dynamic onChange,
  dynamic ontab,
  bool isPasword = false,
  required dynamic validate,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  dynamic sufixpressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPasword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: ontab,
        validator: validate,
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: sufixpressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: OutlineInputBorder(),
        ));

Widget itemSouraOrVarses(
    {required String nameSoura, required BuildContext context, int? index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, souraDetails.route_Name,
            arguments: argData(index!, nameSoura));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          nameSoura,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    ),
  );
}
