package guestbook.bean;


public class GuestbookDTO {
	
	private String name;
	private String email;
	private String homepage;
	private String subject;
	private String content;
	
	private String logtime;
	
	public GuestbookDTO(String name, String email, String homepage, String subject, String content) {
		this.name = name;
		this.email = email;
		this.homepage = homepage;
		this.subject = subject;
		this.content = content;
	}
	
	
	
	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getHomepage() {
		return homepage;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}



	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime=logtime;
	}
}

	
	

