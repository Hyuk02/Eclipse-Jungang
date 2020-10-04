package fileout;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class BookInput {
	public static void main(String[] args) throws FileNotFoundException, IOException, ClassNotFoundException {
		List<Book> list = new ArrayList<>();
		try(ObjectInputStream ois=
		    new ObjectInputStream(new FileInputStream("k2.txt"))){
			while(true) {
				Book book =(Book)ois.readObject();
				System.out.println(book.subject);
				System.out.println(book.price);
				System.out.println(book.write);
				System.out.println(book.publish);
				System.out.println("==============");
				list.add(book);
			}
		}catch(Exception e) {}
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).subject);
		}

	}

}
