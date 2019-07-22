package com.palza.ex;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.palza.ex.dao.IDao;
import com.palza.ex.dto.productDto;

/**
 * Handles requests for the application home page.
 */

@Controller
public class ProductController2 {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	FileUploadService fileUploadService;
	
	@RequestMapping( "/form" )
	public String form() {
		return "form";
	}
	
	@RequestMapping( "/additemed" )
//	@ResponseBody
	public String upload(HttpServletRequest request,
			RedirectAttributes redirect,
			HttpSession session,
			Model model,			
			@RequestParam("file1") MultipartFile file,
			productDto dto)throws Exception {
		
		String path = request.getSession().getServletContext().getRealPath("/")+"resources\\/";
//		String path = "d:\\";
		String path2 = "D:\\apache-tomcat-8.5.33_치승\\webapps\\ROOT\\resources\\";
		System.out.println(" request.getSession().getServletContext().getRealPath(\"/\") = "+ request.getSession().getServletContext().getRealPath("/"));
		System.out.println("path = "+path);

		IDao dao = sqlSession.getMapper(IDao.class);
		Upload upload = new Upload();
		String savedName = "pen.png";
		//dto.setImg(file.getOriginalFilename());
		System.out.println("id = "+session.getAttribute("mId"));
		if( session.getAttribute("mId") == null)
			return "redirect:login";
		dto.setRg_id((String) session.getAttribute("mId"));
		//String url = fileUploadService.restore(file);
		//dto.setImg(url);
		
		if(file.getOriginalFilename() != "") {
			 savedName = upload.uploadFile(dto.getImg(), file.getOriginalFilename(), file.getBytes(),path2);
		}
		// db에 전달할 파일 이름세팅
		dto.setImg(savedName);
		System.out.println(dto.getImg());
		System.out.println(dto);
		dao.additemDao(dto);
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "상품등록이 완료되었습니다.");
		
		
		System.out.println("dto = "+dto);
				
//		dto.setRg_id(session."));
		
//		File file11 = new File("d:"+File.pathSeparator+"upload"+File.pathSeparator+"a.txt");
//		file11.delete();
		
//		System.out.println(file.getOriginalFilename());
//		String price = request.getParameter("price");
//		String cate = request.getParameter("category");
//		System.out.println(price+cate);
//		dao.additemDao(request.getParameter("pd_name"),Integer.parseInt(price),Integer.parseInt(cate),request.getParameter("pd_desc"),request.getParameter("img"));
		
		
		//System.out.println("url = "+ url);
		//dao.additemDao(dto);
		

		
//		//model.addAttribute("url", url);
		return "redirect:main";
	}	
}