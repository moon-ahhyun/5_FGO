package tsys.sales.web;

import javax.servlet.http.HttpServletRequest;

import tsys.sales.common.SalesBusinessException;
import tsys.sales.common.SalesSystemException;
import tsys.sales.entity.Hotel;

public class ToAccountAction {
	public String execute(HttpServletRequest req){
		String page = "/Account/NewAccount.jsp";							//入力画面を戻り値に設定

			return page;
	}
}
