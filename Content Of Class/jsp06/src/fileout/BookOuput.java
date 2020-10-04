package fileout;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class BookOuput {
	public static void main(String[] args) throws FileNotFoundException, IOException {
		Book b1=new Book("죄와벌", 20000, "토스토에프스끼", "중앙");
		Book b2=new Book("나목",20000,"박완서","창밖");
		Book b3=new Book("하수와고수",1000,"강병호","푸른숲");
		
		try(ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("k2.txt"))){
			oos.writeObject(b1);
			oos.writeObject(b2);
			oos.writeObject(b3);
		}
	}
}
