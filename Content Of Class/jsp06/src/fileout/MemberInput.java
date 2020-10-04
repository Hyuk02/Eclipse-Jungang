package fileout;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class MemberInput {
 public static void main(String[] args) {
	 List<Member> list = new ArrayList<>();
   try(ObjectInputStream ois=
		new ObjectInputStream(new FileInputStream("memer.txt"))){
	   while(true) {
		   Member member =(Member)ois.readObject();
		   list.add(member);
	   }
   }catch(Exception e) {}
   for(Member m:list) {
	   System.out.println(m.getId()+","+m.getPwd()+","+m.getName());
   }
}

}
