package team5.model;

public class Member {
	// 기본
	private int id;
	private String userId;
	private String userPw;
	private String name;
	private String tel;
	private String gender;
	private String birthdate;
	private String postcode;
	private String addr1;
	private String addr2;
	private String profileImg;
	private String bankBrand;
	private String bankNum;
	private String bankUser;
	private String regDate;
	private String editDate;
	// 비밀번호 수정용
	private String newUserPw;
	
	// 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getBankBrand() {
		return bankBrand;
	}
	public void setBankBrand(String bankBrand) {
		this.bankBrand = bankBrand;
	}
	public String getBankNum() {
		return bankNum;
	}
	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}
	public String getBankUser() {
		return bankUser;
	}
	public void setBankUser(String bankUser) {
		this.bankUser = bankUser;
	}
	public String getRedDate() {
		return regDate;
	}
	public void setRedDate(String redDate) {
		this.regDate = redDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getNewUserPw() {
		return newUserPw;
	}
	public void setNewUserPw(String newUserPw) {
		this.newUserPw = newUserPw;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", tel=" + tel
				+ ", gender=" + gender + ", birthdate=" + birthdate + ", postcode=" + postcode + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", profileImg=" + profileImg + ", bankBrand=" + bankBrand + ", bankNum="
				+ bankNum + ", bankUser=" + bankUser + ", redDate=" + regDate + ", editDate=" + editDate
				+ ", newUserPw=" + newUserPw + "]";
	}
	
	
	 
	
}
