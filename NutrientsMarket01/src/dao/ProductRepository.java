package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import dto.Product;
import mvc.database.DBConnection;

public class ProductRepository {
	
private static ProductRepository instance=new ProductRepository();
	List<Product> listOfProduct =new Vector<Product>();
	public static ProductRepository getInstance() {return instance;}
	
	//생성자 초기화
	public ProductRepository() {}
	
	public List<Product> getListOfProduct() {return listOfProduct;}
	
	public List<Product> getAllProducts() {
		System.out.println(listOfProduct.size());
		return listOfProduct;
	}

	public Product getProductById(String id) {
		System.out.println("전달된ID:"+id);
		System.out.println("전체 등록갯수:"+listOfProduct.size());
		
		for (int i = 0; i < listOfProduct.size(); i++) {
			Product product = listOfProduct.get(i);
			if (product.getProductId().equals(id)) {
				System.out.println("X");
				return product;
			}
		}	 
		return null;
	}

	//상품정보 추가
	public void addProduct(Product product) {listOfProduct.add(product);}

	//파일로 저장 메소드
	public void outputFile(List<Product> listOfProduct) {
		try(ObjectOutputStream oos
			=new ObjectOutputStream(new FileOutputStream(new File("c:\\temp\\productList.dat")))){
			oos.writeObject(listOfProduct);
			System.out.println("저장완료");
		}catch(Exception e) {
			System.out.print(e.getMessage());
		}
	}

	//저장된 파일로 부터 읽어오기
	public void inputFile() {
		try(ObjectInputStream ois
			=new ObjectInputStream(new FileInputStream(new File("c:\\temp\\productList.dat")))){
			listOfProduct =(List<Product>)ois.readObject();
		}catch(Exception e) {System.out.println(e.getMessage());}
	}

	public String getProductSeq() {
	 String seq=listOfProduct.get(listOfProduct.size()-1)
			    .getProductId().substring(1);//P1234
	 int iSeq=Integer.parseInt(seq)+1;
	 return "P"+iSeq;
	}

	public List<String> getCategories(){
		//카테고리 정보를 중복되지 않게 저장하기 위해 set에 저장
		Set<String> set=new HashSet<String>();	
		for(Product p : listOfProduct) {
			  set.add(p.getCategory());
		}
		System.out.println(set);
		
		//set에 저장된 카테고리정보 list에 저장
		Iterator<String> itor=set.iterator();
		List<String> list = new ArrayList<String>();
		while(itor.hasNext()) {
			list.add(itor.next());
		}
		
		return list;
	}
	
	public List<Product> getProductList(String condition,String category) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product order by p_id";
		
		if(condition.equals("price asc")) {
			sql="select * from product where p_category like '%"+category+"%' order by p_price";
		}else if(condition.equals("price desc")) {
			sql="select * from product where p_category like '%"+category+"%' order by p_price desc";
		}
				
		//view로 보낼 상품목록 리스트 객체 생성
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			con = DBConnection.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_price"));
				product.setDescription(rs.getString("p_description"));
				product.setBrand(rs.getString("p_brand"));
				product.setUnitsInStock(rs.getInt("p_stock"));
				product.setCategory(rs.getString("p_category"));
				product.setFilename(rs.getString("p_fileName"));
				
				list.add(product);
			}
		} catch (Exception e) {
			System.out.println("getProductList()에러:"+e);
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return list;
	}

}