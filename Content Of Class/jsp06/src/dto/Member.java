package dto;
//Bean
public class Member {
  private String idname;
  private String pw;
  private String myname;
  private String phone1;
  private String phone2;
  private String phone3;
  private String gender;
  private String[] hobbies;
  private String comment;
  
  public Member() {}
  public Member(String idname, String pw, String myname,
		        String phone1, String phone2, String phone3, 
		        String gender,
		        String[] hobbies, String comment) {
	this.idname = idname;
	this.pw = pw;
	this.myname = myname;
	this.phone1 = phone1;
	this.phone2 = phone2;
	this.phone3 = phone3;
	this.gender = gender;
	this.hobbies = hobbies;
	this.comment = comment;
}

public String getIdname() {
	return idname;
}
public void setIdname(String idname) {
	this.idname = idname;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getMyname() {
	return myname;
}
public void setMyname(String myname) {
	this.myname = myname;
}
public String getPhone1() {
	return phone1;
}
public void setPhone1(String phone1) {
	this.phone1 = phone1;
}
public String getPhone2() {
	return phone2;
}
public void setPhone2(String phone2) {
	this.phone2 = phone2;
}
public String getPhone3() {
	return phone3;
}
public void setPhone3(String phone3) {
	this.phone3 = phone3;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String[] getHobbies() {
	return hobbies;
}
public void setHobbies(String[] hobbies) {
	this.hobbies = hobbies;
}
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}


  

  
}
