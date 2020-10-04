package fileout;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class BookOutput2 {
	public static void main(String[] args) throws FileNotFoundException, IOException {
	  Book b1 = new Book("이것이 자바다", 30000, "홍길동", "한빛");
	  Book b2 = new Book("jsp2.3", 40000, "임꺽정", "한메");
	  
	  try(ObjectOutputStream oos 
			  =new ObjectOutputStream(new FileOutputStream("k5.txt"))){
		      List<Book> list=new ArrayList<>();
		      list.add(b1);
		      list.add(b2);
		      
		      oos.writeObject(list);
		      oos.close();
		     System.out.println("저장완료");
	  }
	}
}
