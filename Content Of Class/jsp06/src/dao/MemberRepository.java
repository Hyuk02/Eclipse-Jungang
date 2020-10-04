package dao;


import dto.Member;

public class MemberRepository {
 static private MemberRepository instance=new MemberRepository();
 //List<Member> memberList =new LinkedList<>();
 Member[] memberList =new Member[3];
 public MemberRepository() {}
public static MemberRepository getInstance() {
	return instance;
}
//회원리스트 출력
public Member[] getMemberList() {
	return memberList;
}
 
//회원추가
public void addMember(Member member) {
	 for(int i=0;i<memberList.length;i++) {
		 if(memberList[i]==null) {
			 memberList[i]=member;
			 break;
		 }
	 }
}
//회원id로 회원정보 출력
public Member getMember(String id) {
	for(int i=0;i<memberList.length;i++) {
		if(memberList[i]!=null) {
		   Member m=memberList[i];
		 if(m.getIdname().equals(id)) {
			 return m;
		 }
	}
 }
	return null;
 }
}
