package tsys.sales.logic;

import java.sql.Connection;
import java.sql.SQLException;
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
	public boolean orderConfirm(String payment,String memberCode,ArrayList<Item> cart) throws SalesBusinessException, SalesSystemException {
		Connection con = null;
		boolean orderFlag = false;
		try {
			//データベースの接続を取得する。
			con = ConnectionManager.getConnection();

			//ホテルが存在するか確認を行う。
			for (Item item : cart) {
				try{
					//HotelDAOを生成し、メソッドを呼び出す。
					HotelDAO hotelDAO = new HotelDAO(con);
					Hotel dopayment = hotelDAO.findHotelDetail(item.getHotel().getHotelCode());

					//検索結果がない場合、エラーを発生させる。
					if(dopayment == null) {
						throw new SalesBusinessException("エラーが発生しました。");
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw new SalesSystemException("エラーが発生しました。");
				}
			}

			//OrderMasterテーブルの更新
			try{
				//OrderDAOを生成し、メソッドを呼び出す。
				OrderDAO orderDAO = new OrderDAO(con);
				con.setAutoCommit(false);
				orderFlag = orderDAO.insertOrder(cart,orderDate,orderTotal,memberCode,payment);
			} catch (SQLException e) {
					con.rollback();
					e.printStackTrace();
					throw new SalesSystemException("エラーが発生しました。");
			}
			//OrderDetailテーブルの更新
			//予約数のほうが在庫より多い場合はエラー画面へ遷移
			for (Item item : cart) {
				if(item.getReservNo() > item.getHotel().getStock()) {
					throw new SalesSystemException("エラーが発生しました。");
				}  else {
					try {
						orderFlag = orderDAO.insertOrderDetail(orderNo,cart);
					} catch (SQLException e) {
						con.rollback();
						e.printStackTrace();
						throw new SalesSystemException("エラーが発生しました。");
					}
				}
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
		orderFlag = true;
	return orderFlag;
	}
}