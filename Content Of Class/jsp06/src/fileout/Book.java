package fileout;

import java.io.Serializable;

public class Book implements Serializable{
	String subject;
	transient int price;//transient로 선언되 필드는 serialize에서 제외
	String write;
	static String publish;//static선언된 필드는 serialize에서 제외
	
	public Book() {	}

	public Book(String subject, int price, String write,String publisth) {
		this.subject = subject;
		this.price = price;
		this.write = write;
		this.publish=publish;
	}
}
