package tsys.sales.web;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import tsys.sales.entity.Order;
import tsys.sales.entity.OrderDetail;
import tsys.sales.logic.OrderDetailLogic;
import tsys.sales.logic.OrderListLogic;

public class OrderDetailAction {
	public String execute(HttpServletRequest req) throws SQLException {

		String page = null;
		HttpSession session = req.getSession();
		OrderListLogic orderListLogic = new OrderListLogic();

		String orderNostr = (String) req.getParameter("orderNo");
		int orderNoInt = Integer.parseInt(orderNostr);

		session.setAttribute("orderNo", req.getParameter("orderNo"));

		ArrayList<OrderDetail> orderDetailList = OrderDetailLogic.orderDetail(orderNoInt);
		session.setAttribute("orderDetail", orderDetailList);


		ArrayList<Order> orderList = orderListLogic.orderList(orderNoInt);
		session.setAttribute("order", orderList);

		return page;
	}
}