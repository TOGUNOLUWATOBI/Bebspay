/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myUserDtoNode = UserDto.fromJson(map);
*/ 

import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
    String? firstName;
    String? lastName;
    String? address;
    String? lga;
    String? state;
    String? gender;
    String? status;
    String? email;

    UserDto({this.firstName, this.lastName, this.address, this.lga, this.state, this.gender, this.status, this.email}); 

    UserDto.fromJson(Map<String, dynamic> json) {
        firstName = json['FirstName'];
        lastName = json['LastName'];
        address = json['Address'];
        lga = json['Lga'];
        state = json['State'];
        gender = json['Gender'];
        status = json['Status'];
        email = json['Email'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['FirstName'] = firstName;
        data['LastName'] = lastName;
        data['Address'] = address;
        data['Lga'] = lga;
        data['State'] = state;
        data['Gender'] = gender;
        data['Status'] = status;
        data['Email'] = email;
        return data;
    }
}

