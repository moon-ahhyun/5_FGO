/**
 *
 * OrderDAO.java
 *
 */
package tsys.sales.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tsys.sales.entity.Member;
import tsys.sales.entity.Order;
import tsys.sales.entity.OrderDetail;

public class OrderDAO {

    private Connection con;  //接続オブジェクト

    /*
     * コンストラクタ
     */
    public OrderDAO(Connection con) {
    	this.con = con;
    }

    /*
     * 注文一覧
     */
    public ArrayList<Order> findOrder(String memberCode){
    	String sql = "SELECT * FROM OrderMaster WHERE MemberCode = ?";
    	PreparedStatement stmt = null;
    	ResultSet res = null;
    	Member member = null;
    	ArrayList<Order> orderList = new ArrayList<Order>();

    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, memberCode);
    		res = stmt.executeQuery();

    		//検索結果がある場合、検索結果の数だけOrderListに格納する。
    		if(res.next()) {
    			orderList.add( new Order(
    					res.getInt("orderNo"),
    					res.getDate("orderDate"),
    					res.getInt("orderTotal"),
    					res.getString("memberCode"),
    					res.getString("payment")));
    		}
    	} catch (SQLException e) {
    		throw e;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	return orderList;
    }

    /*
     * 注文詳細
     */
    public ArrayList<OrderDetail> findOrderDetail(int orderNo){
    	String sql = "SELECT * FROM OrderDetail WHERE OrderNo = ?";
    	PreparedStatement stmt = null;
    	ResultSet res = null;
    	Member member = null;
    	ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();

    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setint(1, orderNo);
    		res = stmt.executeQuery();

    		//検索結果がある場合、検索結果の数だけOrderDetailListに格納する。
    		if(res.next()) {
    			orderDetailList.add( new OrderDetail(
    					res.getInt("orderNo"),
    					res.getString("itemCode"),
    					res.getString("name"),
    					res.getInt("price"),
    					res.getInt("quantity")));
    		}
    	} catch (SQLException e) {
    		throw e;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	return orderDetailList;
    }

    /*
     * Orderテーブルに追加
     */
    public boolean insertOrder(Order order){
    	boolean insertFlag = false;
    	//OrderMasterテーブルに該当の受注情報を追加
    	String sql = "INSERT INTO OrderMaster VALUES ('?','?','?','?')";
    	PreparedStatement stmt = null;
    	ResultSet res = null;
    	con.setAutoCommit(false);
    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setInt(1, Order.OrderNo);
    		stmt.setDate(2, Order.Date);
    		stmt.setInt(3, Order.Total);
    		stmt.setString(4, Order.MemberCode);
    		stmt.setString(5, Order.Payment);
    		res = stmt.executeUpdate();
    	} catch (SQLException e) {
    		return insertFlag;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	//OrderMasterテーブルに該当の受注情報を追加
    	sql = "INSERT INTO OrderDetail VALUES ('?','?','?','?')";
    	stmt = null;
    	res = null;

    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setInt(1, OrderDetail.OrderNo);
    		stmt.setString(2, OrderDetail.ItemCode);
    		stmt.setInt(3, OrderDetail.Price);
    		stmt.setInt(4, OrderDetail.Quantity);
    		res = stmt.executeUpdate();
    	} catch (SQLException e) {
    		return insertFlag;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	con.commit();
    	insertFlag = true;
    	return insertFlag;
    }

    /*
     * Orderテーブルから削除
     */

    public boolean deleteOrder(int OrderNo){
    	boolean deleteFlag = false;
    	//OrderMasterテーブルから該当の受注情報を削除
    	String sql = "DELETE FROM OrderMaster WHERE OrderNo = ?";
    	PreparedStatement stmt = null;
    	ResultSet res = null;
    	con.setAutoCommit(false);
    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setInt(1, OrderNo);
    		res = stmt.executeUpdate();
    	} catch (SQLException e) {
    		return deleteFlag;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	//OrderDetailテーブルから該当の受注情報を削除
    	sql = "DELETE FROM OrderDetail WHERE OrderNo = ?";
    	stmt = null;
    	res = null;
    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setInt(1, OrderNo);
    		res = stmt.executeUpdate();
    	} catch (SQLException e) {
    		return deleteFlag;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	con.commit();
    	deleteFlag = true;
    	return deleteFlag;
    }

    /*
     * メンバーの1件検索
     */
    public Member findAddress(String memberCode){
    	String sql = "SELECT * FROM Member WHERE MemberCode = ?";
    	PreparedStatement stmt = null;
    	ResultSet res = null;
    	Member member = null;

    	try {
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, memberCode);
    		res = stmt.executeQuery();

    		//検索結果がある場合、戻り値に設定する。
    		if(res.next()) {
    			member = new Member(
    					res.getString("memberCode"),
    					res.getString("name"),
    					res.getString("password"),
    					res.getString("mail"),
    					res.getString("zipCode"),
    					res.getString("prefecture"),
    					res.getString("address"),
    					res.getString("tel"));
    		}
    	} catch (SQLException e) {
    		throw e;
    	} finally {
    		if(res != null) {
    			res.close();
    		}
    		if (stmt != null) {
    			stmt.close();
    		}
    	}
    	return Member;
    }
}