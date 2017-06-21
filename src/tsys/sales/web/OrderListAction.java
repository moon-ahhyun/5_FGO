package tsys.sales.web;//tsys.sales.web;

import tsys.sales.entity.*;
import tsys.sales.logic.*;
import javax.servlet.http.*;
import java.util.*;

public class OrderListAction {
	public String execute(HttpServletRequest req) {
		String page = "/Order/OrderList.jsp";
		req.getSession();
		String memberCode = req.getParameter("memberCode");
		try {
			OrderListLogic orderListLogic = new OrderListLogic();
			ArrayList<Order> orderList =  null;
			orderList = orderListLogic.orderList(memberCode);
			if (orderList == null) {
				req.setAttribute("message", "注文履歴なし。");
				return page;
			}
		}catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}
		return page;
	}
}