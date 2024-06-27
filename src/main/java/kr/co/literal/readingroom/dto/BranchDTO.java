package kr.co.literal.readingroom.dto;


public class BranchDTO {
	
	public BranchDTO() {}
	
	private String branch_code;
    private String branch_name;
    private String branch_email;
    private String branch_pw;
    private String branch_detail;
    private String branch_address;
    private String latitude;
    private String longitude;
    
	public String getBranch_code() {
		return branch_code;
	}
	public void setBranch_code(String branch_code) {
		this.branch_code = branch_code;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_email() {
		return branch_email;
	}
	public void setBranch_email(String branch_email) {
		this.branch_email = branch_email;
	}
	public String getBranch_pw() {
		return branch_pw;
	}
	public void setBranch_pw(String branch_pw) {
		this.branch_pw = branch_pw;
	}
	public String getBranch_detail() {
		return branch_detail;
	}
	public void setBranch_detail(String branch_detail) {
		this.branch_detail = branch_detail;
	}
	public String getBranch_address() {
		return branch_address;
	}
	public void setBranch_address(String branch_address) {
		this.branch_address = branch_address;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	@Override
	public String toString() {
		return "BranchDTO [branch_code=" + branch_code + ", branch_name=" + branch_name + ", branch_email="
				+ branch_email + ", branch_pw=" + branch_pw + ", branch_detail=" + branch_detail + ", branch_address="
				+ branch_address + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
    
    

	
}
