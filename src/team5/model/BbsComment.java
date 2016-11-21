package team5.model;

public class BbsComment {
	// 기본
	private int id;
	private String content;
	private String regDate;
	private String editDate;
	private String ipAddress;
	// 참조
	private int memberId;
	private int bbsDocumentId;
	
	// 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getBbsDocumentId() {
		return bbsDocumentId;
	}
	public void setBbsDocumentId(int bbsDocumentId) {
		this.bbsDocumentId = bbsDocumentId;
	}
	@Override
	public String toString() {
		return "BbsComment [id=" + id + ", content=" + content + ", regDate=" + regDate + ", editDate=" + editDate
				+ ", ipAddress=" + ipAddress + ", memberId=" + memberId + ", bbsDocumentId=" + bbsDocumentId + "]";
	}
	
}
