package com.exe.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;


@Service("fileManager")
public class FileManager {
	
	//파일 업로드
	public static String doFileUpload(File uploadFile, String originalFileName, String path) throws FileNotFoundException, IOException {
		
		String newFileName = null;
		
		if(uploadFile==null) { //업로드할 파일이 없으면 null값 반환
			return null;
		}

		if(originalFileName.equals("")) {
			return null;
		}
		
		//파일 확장자
		String fileExt = originalFileName.substring(originalFileName.lastIndexOf(".")); //뒤에서부터 "."을 찾으면 그 뒤가 확장자이기 때문에 확장자를 알 수 있다.
		
		if(fileExt==null || fileExt.equals("")) {
			return null;
		}
		
		newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance()); // 년/월/일/시/분/초    
																							   //1$:하나로 대체(안쓰면 Calendar.getInstance()를 다섯번 써줘야함)
		newFileName += System.nanoTime(); //파일이름중복을 막기 위해 nanoTime(10의 -9승) 지정
		newFileName += fileExt;
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String fullFileName = path + File.separator + newFileName;
		
		FileInputStream fis = new FileInputStream(uploadFile);
		//파일내보내기 //새롭게 만든 이름을 받아와 db에 저장
		FileOutputStream fos = new FileOutputStream(fullFileName);
		
		int data = 0;
		byte[] buffer = new byte[1024];
		
		while((data=fis.read(buffer, 0, 1024))!=-1) {
			
			fos.write(buffer, 0, data);
		}			
		
		fis.close();
		fos.close();
		
		return newFileName;
		
	}
	
	public static String doFileUpload(InputStream uploadFile, 
			String originalFileName,String path) throws Exception {
		
		String newFileName=null;
		
		if(uploadFile==null)
			return null;
		
		/*String originalFileName = uploadFile.getFileName();*/
		
		if(originalFileName.equals(""))
			return null;
		
		//파일 확장자
		String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."));
	
		if(fileExt==null || fileExt.equals(""))
			return null;
		
		
		newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance()); //연월일	
		newFileName += System.nanoTime();
		newFileName += fileExt;
	
		
		File f = new File(path);
		if(!f.exists())
			f.mkdirs();
		
		String fullFileName =path+File.separator + newFileName;
		
		/*byte[] data = uploadFile.getFileData();*/
		//FileInputStream fis = new FileInputStream(uploadFile);		
		FileOutputStream fos = new FileOutputStream(fullFileName);
		int data=0;
		byte[] buffer = new byte[1024];
		
		while((data=uploadFile.read(buffer,0,1024))!=-1) {
			fos.write(buffer,0,data);
		}
		//fos.flush();
		uploadFile.close();
		fos.close();
		
		return newFileName;
		
		
	}
	
	
	//파일 다운로드
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName, String path) {
		
		try {
			
			String fullPath = path + File.separator + saveFileName;
			
			//java가 String null값을 체크 못할 때가 있기 때문에 두번 써주기
			//혹시 original파일이름이 없을 경우, save파일이름으로 동일시 해주기
			if(originalFileName==null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			//한글이름 파일을 다운받을 때 깨짐 방지
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1"); //euc-kr : 2byte & ISO-8859-1 : 
			
			File f = new File(fullPath); //fullPath를 file이 관리하기 시작
			
			if(!f.exists()) {
				return false;
			}
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
			
			//server에 저장된 file을 먼저 읽어내어 client에게 내보내야함
			//(읽어내야하기 때문에 inputStream을 쓴다)
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			OutputStream out = response.getOutputStream(); //출력기
			
			//client에게 내보내기
			int data;
			byte bytes[] = new byte[4096]; //4096바이트만큼 읽어서 client에게 내보냄
			
			while((data=bis.read(bytes,0,4096))!=-1) {
				out.write(bytes,0,data);
			}
			
			out.flush();
			out.close();
			bis.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
	
	
	//파일 삭제
	public static void doFileDelete(String fileName,String path) {

		try {
			
			String fullPath = path + File.separator + fileName;
			
			File f = new File(fullPath);
			
			if(f.exists()) {
				f.delete();
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}


}
