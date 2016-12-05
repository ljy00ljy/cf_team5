package team5.model;

public class Present {
	// 테이블
	private int id;
	private int money;
	private String info;
	// 참조
	private int projectId;
	// 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	@Override
	public String toString() {
		return "Present [id=" + id + ", money=" + money + ", info=" + info + ", projectId=" + projectId + "]";
	}
	
	
}
