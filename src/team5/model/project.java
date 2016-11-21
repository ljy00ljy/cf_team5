package team5.model;

public class project {
	// 기본
	private int projectId;
	private String title;
	private String titleS;
	private String titleImg;
	private String titleText;
	private String category;
	private String url;
	private String producerImage;
	private String producerName;
	private String producerInfo;
	private String producerArea;
	private int projectMoney;
	private String startDate;
	private String endDate;
	private String legal;
	private String video;
	private String story;
	private String projectStatus;
	// 참조
	private int memberId;
	//
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
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
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
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
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "project [projectId=" + projectId + ", title=" + title + ", titleS=" + titleS + ", titleImg=" + titleImg
				+ ", titleText=" + titleText + ", category=" + category + ", url=" + url + ", producerImage="
				+ producerImage + ", producerName=" + producerName + ", producerInfo=" + producerInfo
				+ ", producerArea=" + producerArea + ", projectMoney=" + projectMoney + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", legal=" + legal + ", video=" + video + ", story=" + story
				+ ", projectStatus=" + projectStatus + ", memberId=" + memberId + "]";
	}
	
}
