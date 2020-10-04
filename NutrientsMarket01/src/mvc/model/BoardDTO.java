package mvc.model;
//bean생성
public class BoardDTO {
	//테이블의 칼럼면 타입과 같은 속성 선언
	private int num;//순번
	private String id;//작성자 아이디
	private String subject;//제목
	private String product;
	private String content;//내용
	private String fileName;//내용
	private String write_day;//등록날짜
	private int hit;//조회수
	
	public BoardDTO() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getWrite_day() {
		return write_day;
	}

	public void setWrite_day(String write_day) {
		this.write_day = write_day;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
