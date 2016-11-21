package team5.model;

public class Pledges {
	// 기본
	private int id;
	private int fundMoney;
	private String fundDate;
	// 참조
	private int projectId;
	private int memberId;
	private int presentId;
	//
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFundMoney() {
		return fundMoney;
	}
	public void setFundMoney(int fundMoney) {
		this.fundMoney = fundMoney;
	}
	public String getFundDate() {
		return fundDate;
	}
	public void setFundDate(String fundDate) {
		this.fundDate = fundDate;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getPresentId() {
		return presentId;
	}
	public void setPresentId(int presentId) {
		this.presentId = presentId;
	}
	@Override
	public String toString() {
		return "Pledges [id=" + id + ", fundMoney=" + fundMoney + ", fundDate=" + fundDate + ", projectId=" + projectId
				+ ", memberId=" + memberId + ", presentId=" + presentId + "]";
	}
	
}
