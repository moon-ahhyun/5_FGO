package tsys.sales.web;//tsys.sales.web;

import tsys.sales.entity.*;

import tsys.sales.logic.*;
import javax.servlet.http.*;
import java.util.*;

public class OrderListAction {
	public String execute(HttpServletRequest req) {
		String page = "/Order/OrderList.jsp";
		HttpSession session = req.getSession();
		String memberCode = (String) session.getAttribute("memberCode");

		try {
			OrderListLogic orderListLogic = new OrderListLogic();
			ArrayList<Order> orderList =  null;
			ArrayList<String> orderNoList = new ArrayList<String>();

			orderList = orderListLogic.orderList(memberCode);

			if (orderList.isEmpty()) {
				req.setAttribute("message", "注文履歴なし。");
				return page;
			} else {
				for (Order order : orderList){
					orderNoList.add(Integer.toString(order.getOrderNo()));
				}
				req.setAttribute("orderList", orderList);
				req.setAttribute("orderNoList", orderNoList);
			}
		}catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}
		return page;
	}
}
