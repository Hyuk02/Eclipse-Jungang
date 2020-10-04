package fileout;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.List;

public class BookInput2 {
	public static void main(String[] args) throws FileNotFoundException, IOException, ClassNotFoundException {
		try(ObjectInputStream ois
			=new ObjectInputStream(new FileInputStream("k5.txt"))){
			//역직렬화
			List<Book> list =(List<Book>)ois.readObject();
		 for(int i=0;i<list.size();i++) {
			  Book b1 = list.get(i);
			//Book b1=(Book)ois.readObject();
			System.out.println(b1.subject);
			System.out.println(b1.price);//transient
			System.out.println(b1.write);
			System.out.println(b1.publish);//static
		  }
		}
	}
}