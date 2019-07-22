package com.palza.ex;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.FileCopyUtils;

public class Upload {
	String ps = File.pathSeparator;
	String path = new String();
	
	// String uploadPath = "C:\\Users\\305\\Desktop\\Spring\\Handas\\Handas_ex2\\src\\main\\webapp\\resources\\images\\shop_images";
	// 톰캣 이클립스 이미지 파일 저장 경로 : 집
	//String uploadPath ="C:\\Users\\Data\\oxyzen_eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Handas_ex2\\resources\\images\\shop_images";
	// 학원
	@Autowired
	ServletContext sc;
	
	@Autowired
    ResourceLoader resourceLoader;

//	String uploadPath = "C:\\apache-tomcat-8.5.41\\wtpwebapps\\palzaProject\\resources\\images";
	
	// 가빈 폴더
	//String uploadPath = "C:\\Users\\shinh\\Desktop\\JAVA Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Handas_ex2\\resources\\images\\shop_images";
	
	// 업로드 메서드
	public String uploadFile(String pname, String originalName, byte[] fileData, String path) throws Exception {
		this.path = path;
//		Resource resource = resourceLoader.getResource("classpath:test.txt");
//        System.out.println(resource.exists());
//        System.out.println(resource.getDescription());
//        System.out.println(resource.getURI().getPath());
//		String realpath = sc.getRealPath("/");
//		System.out.println("realpath = "+realpath);


		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMdd_HHmmss");
		Date today = new Date();
		
		// 랜덤 이름 생성
		//UUID uid = UUID.randomUUID();  // 사용법  : "_" + uid.toString() 
		// 저장될 파일이름 :  날짜 + 파일 이름 + 랜덤이름 
		String savedName = format.format(today) + "_"  + originalName;
		File file = new File(path, savedName);
		// 실제 파일 저장
		FileCopyUtils.copy(fileData, file);
		return savedName;
	}
	
	// 파일 삭제
	public void deleteFile(String img) throws Exception {
		File file = new File(path);
     
		if( file.exists() ){
	        if(file.delete()){
	            System.out.println("파일삭제 성공");
	        }else{
	            System.out.println("파일삭제 실패");
	        }
	    }else{
	        System.out.println("파일이 존재하지 않습니다.");
	    }
	}
}

