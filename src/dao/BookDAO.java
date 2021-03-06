package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import conn.ConnectionUtils;
import model.*;
import utils.DBUtils;

public class BookDAO implements ObjectDAO {
	public static Map<String, Book> mapSanPham = layDuLieuTuDatabase();
	public static Map<String, Book> mapUndo = new HashMap<>();

	@Override
	public boolean add(Object obj) {
		Book sp = (Book) obj;
		mapSanPham.put(sp.getId(), sp);
		try {
			String sql = "insert into Books values (?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getTitle());
			ppstm.setString(2, sp.getPrice());
			ppstm.setString(3, sp.getSale_price());
			ppstm.setString(4, sp.getPublish_year());
			ppstm.setString(5, sp.getPicture());
			ppstm.setString(6, sp.getPage_number());
			ppstm.setString(7, sp.getQuantity());
			ppstm.setString(8, sp.getQuotes_about());
			ppstm.setString(9, sp.getAuthor_id());
			ppstm.setString(10, sp.getPublisher_id());
			ppstm.setString(11, sp.getCategory_id());
			ppstm.setString(12, sp.get_new());
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Lá»—i truy váº¥n Ä‘b " + e.getMessage());
			return false;
		}
		return true;
	}

	public boolean undo() {
		mapSanPham.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

	public String getNameBook(String id) {
		String name = "";
		for (Book kh : mapSanPham.values()) {
			if (kh.getId().equals(id)) {
				name = kh.getTitle();
			}
		}
		return name;
	}
	
	public static Set<String> getSetPublisher() {
		Set<String> publisher = new HashSet<>();
		for (Book sp : mapSanPham.values()) {
			publisher.add(sp.getPublisher_id());
		}
		return publisher;
	}

	public Map<String, Book> getSelectPublisher(String publisherID) {
		Map<String, Book> mapSelectProduct = new HashMap<>();
		for (Book sp : mapSanPham.values()) {
			if (sp.getPublisher_id().equals(publisherID)) {
				mapSelectProduct.put(sp.getId(), sp);
			}
		}
		return mapSelectProduct;
	}

	public static Map<String, Book> layDuLieuTuDatabase() {
		Map<String, Book> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from  Books");
			while (rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String price = rs.getString(3);
				String sale_price = rs.getString(4);
				String publish_year = rs.getString(5);
				String picture = rs.getString(6);
				String page_number = rs.getString(7);
				String quantity = rs.getString(8);
				String quotes_about = rs.getString(9);
				String author_id = rs.getString(10);
				String publisher_id = rs.getString(11);
				String category_id = rs.getString(12);
				String _new = rs.getString(13);
				Book sp = new Book(id, title, price, sale_price, publish_year, picture, page_number,
						quantity, quotes_about, author_id, publisher_id, category_id, _new);
				map.put(sp.getId(), sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public boolean edit(String id,Object obj) {
		Book sp = (Book) obj;
		mapSanPham.replace(id, sp);
		String sql = "update Books set title=?,price=?,sale_price=?,publish_year=?,picture=?,"
				+ "page_number=?,quantity=?,quotes_about=?,author_id=?, publisher_id=?,category_id=?,new=? where id=?";
		try {
			Connection connect = ConnectionUtils.getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, sp.getTitle());
			ppstm.setString(2, sp.getPrice());
			ppstm.setString(3, sp.getSale_price());
			ppstm.setString(4, sp.getPublish_year());
			ppstm.setString(5, sp.getPicture());
			ppstm.setString(6, sp.getPage_number());
			ppstm.setString(7, sp.getQuantity());
			ppstm.setString(8, sp.getQuotes_about());
			ppstm.setString(9, sp.getAuthor_id());
			ppstm.setString(10, sp.getPublisher_id());
			ppstm.setString(11, sp.getCategory_id());
			ppstm.setString(12, sp.get_new());
			ppstm.setString(13, id);
			ppstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del (String id) {
		mapSanPham.remove(id);
		String sql = "delete from Books where id='" + id + "'";
		try {
			Connection conn = ConnectionUtils.getConnection();
			DBUtils.executeSQL(conn, sql);
		} catch (Exception e) {
			System.out.println("Lá»—i truy váº¥n db:" + e.getMessage());
			return false;
		}
		return true;
	}

	public boolean delAll() {
		mapUndo.putAll(mapSanPham);
		mapSanPham.clear();

		return true;
	}

	public static int getNumberPage() {
		String sql = "select count(*) from books";
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn, sql);
			while (rs.next()) {
				int total = rs.getInt(1);
				int countPage = 0;
				countPage = total/5;
				if(total%5 != 0) {
					countPage++;
				}
				return countPage;
			}
		} catch (Exception e) {
			System.out.println("Lỗi lấy dữ liệu:" + e.getMessage());
		}
		return 0;
	}

	public static Map<String, Book> getDetailBook(int idBook) {
		Map<String, Book> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select * from  books where id="+idBook);
			while (rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String price = rs.getString(3);
				String sale_price = rs.getString(4);
				String publish_year = rs.getString(5);
				String picture = rs.getString(6);
				String page_number = rs.getString(7);
				String quantity = rs.getString(8);
				String quotes_about = rs.getString(9);
				String author_id = rs.getString(10);
				String publisher_id = rs.getString(11);
				String category_id = rs.getString(12);
				String _new = rs.getString(13);
				Book sp = new Book(id, title, price, sale_price, publish_year, picture, page_number,
						quantity, quotes_about, author_id, publisher_id, category_id, _new);
				map.put(sp.getId(), sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}
	
	public static Map<String, Book> layDuLieuSachLienQuan(String idCategory) {
		Map<String, Book> map = new HashMap<>();
		
		for (Book sp : mapSanPham.values()) {
			if(sp.getCategory_id().equals(idCategory))
				map.put(sp.getId(), sp);
		}

		return map;
	}
	
	public static Map<String, Book> laySachTheoTrang(int start) {
		Map<String, Book> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select top (9*"+start+") * from books except select top (9*"+(start-1)+") * from books");
			while (rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String price = rs.getString(3);
				String sale_price = rs.getString(4);
				String publish_year = rs.getString(5);
				String picture = rs.getString(6);
				String page_number = rs.getString(7);
				String quantity = rs.getString(8);
				String quotes_about = rs.getString(9);
				String author_id = rs.getString(10);
				String publisher_id = rs.getString(11);
				String category_id = rs.getString(12);
				String _new = rs.getString(13);
				Book sp = new Book(id, title, price, sale_price, publish_year, picture, page_number,
						quantity, quotes_about, author_id, publisher_id, category_id, _new);
				map.put(sp.getId(), sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}
	
	public static Map<String, Book> laySachMuaNhieuNhat() {
		Map<String, Book> map = new HashMap<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ResultSet rs = DBUtils.selectData(conn,"select top 4 book_id, books.title, books.sale_price, books.picture \n"
					+ "from order_details inner join books on order_details.book_id = books.id \n"
					+ "group by book_id, books.id, books.title, books.sale_price, books.picture \n"
					+ "order by book_id asc");
			while (rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String sale_price = rs.getString(3);
				String picture = rs.getString(4);
				Book sp = new Book(id, title, sale_price, picture);
				map.put(sp.getId(), sp);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return map;
	}
}
