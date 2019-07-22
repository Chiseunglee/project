package com.palza.ex;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.palza.ex.dao.IDao;
import com.palza.ex.dto.infoDto;
import com.palza.ex.dto.pageMaker;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("list", dao.allList());
		return "main";
	}
	@RequestMapping(value = "/main")
	public String main(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("list", dao.allList());

		return "main";
	}

	@RequestMapping(value = "/login")
	public String login() {

		return "login";
	}

	@RequestMapping(value = "/logined")
	@ResponseBody
	public String Logined(HttpServletRequest request, HttpSession session) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
	
		if (pwd.equals(dao.loginDao(id))) {
			session.setAttribute("mId", id);
			return "logined";
		} else
			return "loginerror";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "/joined")

	public String joined(HttpServletRequest request,Model model) {
	
		if(!(request.getParameter("pw").equals(request.getParameter("pwchk"))))
		  return "joinerror";
	  
	  String address = request.getParameter("address1") + "/" + request.getParameter("address2") + "/" + request.getParameter("address3");
	
      IDao dao = sqlSession.getMapper(IDao.class);
      dao.joinDao(request.getParameter("id"),request.getParameter("pw"),request.getParameter("name"),request.getParameter("email"),address,request.getParameter("tel"));
      
	return "joined";
	}
	
	@RequestMapping("/logout")
	public String Logout(HttpSession session) {
		session.removeAttribute("mId");
		
		return "redirect:main";
		
	}
	
	@RequestMapping(value = "/findid")
	public String findid() {
		return "findid";
	}

	@RequestMapping(value = "/findidcheck")
	public String findidcheck(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("findidcheck", dao.findid(request.getParameter("name"),request.getParameter("email")));

		return "returnid";
	}

	@RequestMapping(value = "/findpwd")
	public String findpwd() {
		return "findpwd";
	}

	@RequestMapping(value = "/findpwdcheck")
	public String findpwdcheck(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		model.addAttribute("findpwdcheck", dao.findpwd(request.getParameter("id")));

		return "returnpwd";
	}
	
	@RequestMapping(value = "/mypage")
	   public String mypage(Model model, HttpServletRequest request,HttpSession session) {

	      IDao dao = sqlSession.getMapper(IDao.class);
	      
	      String id = (String)session.getAttribute("mId");
	         
	       String str3 = dao.address(id);
	        String[] splitTest = str3.split("/");
	      
	      System.out.println(id);
	      model.addAttribute("dto", dao.modify(id));
	      model.addAttribute("address", splitTest);
	      
	      
	      return "mypage";
	   
	   }
	
	@RequestMapping(value = "/edited")
	   public String edited(HttpServletRequest request,HttpSession session, Model model) {

	      IDao dao = sqlSession.getMapper(IDao.class);
	      
	      String address = request.getParameter("address0") + "/" + request.getParameter("address1") + "/" + 
	             request.getParameter("address2");
	   
	      
	      String id = (String)session.getAttribute("mId");
	      
	      
	      System.out.println(request.getParameter("email"));
	      
	      dao.updateinfo(request.getParameter("pw"), request.getParameter("email"), address, request.getParameter("tel"),id);
	      
	      
	      
	   /*   model.addAttribute("dto" ,dto);
	*/
	      return "edited";

	   }
	
	
	   @RequestMapping(value = "/itemview")
	   public String itemview(HttpSession session, HttpServletRequest request, Model model) {
	      
	      IDao dao = sqlSession.getMapper(IDao.class);
	      int pd_id = Integer.parseInt(request.getParameter("pd_id"));
	      String id = (String)session.getAttribute("mId");
	      
	      if (session.getAttribute("mId") == null) {
	         model.addAttribute("item", dao.itemView("null", pd_id));
	         model.addAttribute("chk", false);
	      } 
	      else {
	         model.addAttribute("item", dao.itemView(id, pd_id));
	            if (dao.wishCheck(id, pd_id) == 1) {
	               model.addAttribute("chk", true);
	            } else {
	               model.addAttribute("chk", false);
	            }
	      }
	      return "itemview";
	   }
	
	@RequestMapping(value ="/additem")
	public String additem(HttpServletRequest request, Model model) {
		
		return "additem";
	}
	
	
	@RequestMapping(value = "/buyitem")
	public String buyitem(HttpServletRequest request, Model model, HttpSession session) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		infoDto id = dao.customerInfo((String)session.getAttribute("mId"));
		model.addAttribute("custom", id);
		int pd_id = Integer.parseInt(request.getParameter("pd_id"));
		
		System.out.println(pd_id);
		model.addAttribute("seller", dao.buyItem(pd_id));
		
		return "buyitem";
	}
	
	   @RequestMapping(value = "/cartitem")
	   public String cartitem(Model model, HttpSession session) {
	      
	      IDao dao = sqlSession.getMapper(IDao.class);
	      String id = (String)session.getAttribute("mId");
	      model.addAttribute("list", dao.cartItem(id));      
	      
	      return "cartitem";
	   }
	
	
	   /* 상품리스트 */
	   @RequestMapping("/pd_list")
	   public String pd_list(HttpServletRequest request, Model model, HttpSession session) {
	      IDao dao = sqlSession.getMapper(IDao.class);

	      int currentpage = Integer.parseInt(request.getParameter("currentpage"));
	      int cate_id = Integer.parseInt(request.getParameter("cate_id"));
	      int totalCnt = dao.totalCnt(cate_id);

	      String curId = ((session.getAttribute("mId") == null) ? "x" : (String) session.getAttribute("mId"));
	      pageMaker paging = new pageMaker(currentpage, totalCnt, 9, cate_id, curId);
	      model.addAttribute("list", dao.productList(paging));
	      model.addAttribute("paging", paging);
	      return "pd_list";
	   }
	   
	   
	   @RequestMapping("/cart_push")
	   @ResponseBody
	   public String push(HttpServletRequest request, HttpSession session, @RequestParam("id")int id,@RequestParam("value")String value) {
	      if(session.getAttribute("mId")==null) {
	         return "fail";
	      }
	      IDao dao = sqlSession.getMapper(IDao.class);
	 
	         
	      if(value.trim().equals("blank")) {
	         dao.putWish((String)session.getAttribute("mId"), id);
	         return "push";
	      }
	      else {
	         dao.backWish((String)session.getAttribute("mId"), id);
	         return "back";
	      }
	   }
	   
	   

		
}