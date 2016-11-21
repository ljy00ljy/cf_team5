package team5.model;

public class File {
	// 기본
	private int id;
	private String originName;
	private String fileDir;
	private String fileName;
	private String contentType;
	private long fileSize;
	private String regDate;
	// 참조
	private int memberId;
	private int bbsDocumentId;
	private int projectId;
	// 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getFileDir() {
		return fileDir;
	}
	public void setFileDir(String fileDir) {
		this.fileDir = fileDir;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	@Override
	public String toString() {
		return "File [id=" + id + ", originName=" + originName + ", fileDir=" + fileDir + ", fileName=" + fileName
				+ ", contentType=" + contentType + ", fileSize=" + fileSize + ", regDate=" + regDate + ", memberId="
				+ memberId + ", bbsDocumentId=" + bbsDocumentId + ", projectId=" + projectId + "]";
	}
	
	
}
