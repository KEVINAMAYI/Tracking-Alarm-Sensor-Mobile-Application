import 'package:imei_plugin/imei_plugin.dart';

class ImeiService{


  //GET PHONE IMEI
Future getPhoneImei() async
{

   return await  ImeiPlugin.getImei();

}


//GET PHONE ID
Future getPhoneId() async
{

  return await ImeiPlugin.getId();


}




}