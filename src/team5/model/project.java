package team5.model;

public class Project {
	// 기본
	private int id;
	private String title;
	private String titleS;
	private String titleImage;
	private String titleText;
	private String category;
	private String url;
	private String producerImage;
	private String producerImageThumb;
	private String producerName;
	private String producerInfo;
	private String producerArea;
	private int projectMoney;
	private int nowMoney;
	private int nowPledge;
	private String startDate;
	private String endDate;
	private String legal;
	private String video;
	private String story;
	private String email;
	private String projectStatus;
	private String regDate;
	private String ipAddress;
	// 참조
	private int memberId;
	//
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleS() {
		return titleS;
	}
	public void setTitleS(String titleS) {
		this.titleS = titleS;
	}
	public String getTitleImage() {
		return titleImage;
	}
	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}
	public String getTitleText() {
		return titleText;
	}
	public void setTitleText(String titleText) {
		this.titleText = titleText;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProducerImage() {
		return producerImage;
	}
	public void setProducerImage(String producerImage) {
		this.producerImage = producerImage;
	}
	public String getProducerImageThumb() {
		return producerImageThumb;
	}
	public void setProducerImageThumb(String producerImageThumb) {
		this.producerImageThumb = producerImageThumb;
	}
	public String getProducerName() {
		return producerName;
	}
	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}
	public String getProducerInfo() {
		return producerInfo;
	}
	public void setProducerInfo(String producerInfo) {
		this.producerInfo = producerInfo;
	}
	public String getProducerArea() {
		return producerArea;
	}
	public void setProducerArea(String producerArea) {
		this.producerArea = producerArea;
	}
	public int getProjectMoney() {
		return projectMoney;
	}
	public void setProjectMoney(int projectMoney) {
		this.projectMoney = projectMoney;
	}
	public int getNowMoney() {
		return nowMoney;
	}
	public void setNowMoney(int nowMoney) {
		this.nowMoney = nowMoney;
	}
	public int getNowPledge() {
		return nowPledge;
	}
	public void setNowPledge(int nowPledge) {
		this.nowPledge = nowPledge;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getLegal() {
		return legal;
	}
	public void setLegal(String legal) {
		this.legal = legal;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	@Override
	public String toString() {
		return "Project [id=" + id + ", title=" + title + ", titleS=" + titleS + ", titleImage=" + titleImage
				+ ", titleText=" + titleText + ", category=" + category + ", url=" + url + ", producerImage="
				+ producerImage + ", producerImageThumb=" + producerImageThumb + ", producerName=" + producerName
				+ ", producerInfo=" + producerInfo + ", producerArea=" + producerArea + ", projectMoney=" + projectMoney
				+ ", nowMoney=" + nowMoney + ", nowPledge=" + nowPledge + ", startDate=" + startDate + ", endDate="
				+ endDate + ", legal=" + legal + ", video=" + video + ", story=" + story + ", email=" + email
				+ ", projectStatus=" + projectStatus + ", regDate=" + regDate + ", ipAddress=" + ipAddress
				+ ", memberId=" + memberId + "]";
	}
	
	
}
