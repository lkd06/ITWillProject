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
	
	//���� ���ε�
	public static String doFileUpload(File uploadFile, String originalFileName, String path) throws FileNotFoundException, IOException {
		
		String newFileName = null;
		
		if(uploadFile==null) { //���ε��� ������ ������ null�� ��ȯ
			return null;
		}

		if(originalFileName.equals("")) {
			return null;
		}
		
		//���� Ȯ����
		String fileExt = originalFileName.substring(originalFileName.lastIndexOf(".")); //�ڿ������� "."�� ã���� �� �ڰ� Ȯ�����̱� ������ Ȯ���ڸ� �� �� �ִ�.
		
		if(fileExt==null || fileExt.equals("")) {
			return null;
		}
		
		newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance()); // ��/��/��/��/��/��    
																							   //1$:�ϳ��� ��ü(�Ⱦ��� Calendar.getInstance()�� �ټ��� �������)
		newFileName += System.nanoTime(); //�����̸��ߺ��� ���� ���� nanoTime(10�� -9��) ����
		newFileName += fileExt;
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String fullFileName = path + File.separator + newFileName;
		
		FileInputStream fis = new FileInputStream(uploadFile);
		//���ϳ������� //���Ӱ� ���� �̸��� �޾ƿ� db�� ����
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
		
		//���� Ȯ����
		String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."));
	
		if(fileExt==null || fileExt.equals(""))
			return null;
		
		
		newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance()); //������	
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
	
	
	//���� �ٿ�ε�
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName, String path) {
		
		try {
			
			String fullPath = path + File.separator + saveFileName;
			
			//java�� String null���� üũ ���� ���� �ֱ� ������ �ι� ���ֱ�
			//Ȥ�� original�����̸��� ���� ���, save�����̸����� ���Ͻ� ���ֱ�
			if(originalFileName==null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			//�ѱ��̸� ������ �ٿ���� �� ���� ����
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1"); //euc-kr : 2byte & ISO-8859-1 : 
			
			File f = new File(fullPath); //fullPath�� file�� �����ϱ� ����
			
			if(!f.exists()) {
				return false;
			}
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
			
			//server�� ����� file�� ���� �о�� client���� ����������
			//(�о���ϱ� ������ inputStream�� ����)
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			OutputStream out = response.getOutputStream(); //��±�
			
			//client���� ��������
			int data;
			byte bytes[] = new byte[4096]; //4096����Ʈ��ŭ �о client���� ������
			
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
	
	
	//���� ����
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
