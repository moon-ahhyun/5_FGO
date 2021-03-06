package tsys.sales.logic;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import tsys.sales.common.SalesBusinessException;
import tsys.sales.common.SalesSystemException;
import tsys.sales.dao.ConnectionManager;
import tsys.sales.dao.OrderDAO;
import tsys.sales.dao.HotelDAO;
import tsys.sales.entity.Order;
import tsys.sales.entity.OrderDetail;
import tsys.sales.entity.Hotel;
import tsys.sales.entity.Item;

public class ShoppingCartConfirmLogic {
	/**
	 * ホテルを検索し、
	 * OrderMasterテーブル,OrderDetailテーブルに受注情報を追加
	 * Hotelテーブルの在庫情報を更新
	 * @param order
	 * @return
	 * @throws SalesBusinessException
	 * @throws SalesSystemException
	 */
	public int orderConfirm(String payment,String memberCode,ArrayList<Item> cart) throws SalesBusinessException, SalesSystemException {
		Connection con = null;
		boolean orderFlag = false;
		int orderTotal = 0;
		int orderNo;
		try {
			//データベースの接続を取得する。
			con = ConnectionManager.getConnection();

			//orderDate（受注年月日）の取得
			Calendar cal = Calendar.getInstance();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String orderDate = sdf.format(cal.getTime());

			//orderTotal（合計金額）の計算
			for (Item item : cart) {
				int Total = item.calcPrice();
				orderTotal += Total;
			}

			//HotelDAOを生成し、メソッドを呼び出す。
			HotelDAO hotelDAO = new HotelDAO(con);
			//ホテルが存在するか確認を行う。
			for (Item item : cart) {
				Hotel dopayment = hotelDAO.findHotel(item.getHotel());

				//検索結果がない場合、エラーを発生させる。
				if(dopayment == null) {
					throw new SalesBusinessException("エラーが発生しました。");
				}
			}

			//OrderMasterテーブルの更新
			//OrderDAOを生成し、メソッドを呼び出す。
			OrderDAO orderDAO = new OrderDAO(con);
			con.setAutoCommit(false);
			orderNo = orderDAO.insertOrder(orderDate,orderTotal,memberCode,payment);

			//OrderDetailテーブルの更新
			//予約数のほうが在庫より多い場合はエラー画面へ遷移
			for (Item item : cart) {
				if(item.getReservNo() > item.getHotel().getStock()) {
					throw new SalesSystemException("エラーが発生しました。");
				}
			}
			orderDAO.insertOrderDetail(orderNo,cart);
			//Hotelテーブルの更新
			for (Item item : cart) {
				hotelDAO.updateStock(item.getHotel().getItemCode(), item.getReservNo());
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SalesSystemException("エラーが発生しました。");
		} finally {
			try {
				if (con != null) {
					con.commit();
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new SalesSystemException("エラーが発生しました。");
			}
		}
		return orderNo;
	}
}
