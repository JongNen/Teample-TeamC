package data;

import java.sql.Date;

public class Review {
	
	int postNum;
	String writerName;

	Date writed;
	String title;
	String postBody;
	String writerId;
	
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public Date getWrited() {
		return writed;
	}
	public void setWrited(Date writed) {
		this.writed = writed;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPostBody() {
		return postBody;
	}
	public void setPostBody(String postBody) {
		this.postBody = postBody;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
}
	
	