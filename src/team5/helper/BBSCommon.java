package team5.helper;

public class BBSCommon {
//singleton+
private static BBSCommon singleton = null;
public static BBSCommon getInstance() {
	if (singleton == null) {
		singleton = new BBSCommon();
	}
	return singleton;
}
public static void freeInstance() {
	singleton = null;
}
private BBSCommon() {
	super();
}
//singleton-
public String getBbsName(String category) throws Exception {
	//리턴할 게시판 이름
	String bbsName = null;
	//카테고리값이 존재한다면 게시판 이름을 판별
	if (category != null) {
		if (category.equals("notice")) {
			bbsName="공지사항";
		} else if (category.equals("free")) {
			bbsName="자유게시판";
		} else if (category.equals("gallery")) {
			bbsName="갤러리";
		} else if (category.equals("qna")) {
			bbsName="질문/답변";
		}
	}
	//생성된 게시판 이름이 없다면 예외를 발생 시킨다.
	if (bbsName == null) {
		throw new Exception("존재하지 않는 게시판 입니다.");
	}
	return bbsName;
}
}
