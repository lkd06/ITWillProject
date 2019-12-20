package com.exe.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.mybatis.spring.SqlSessionTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


//DB 없이 순수 XML로만 시도
public class TmemDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public Map<String, String> readXml(int selectNum) throws ParserConfigurationException, SAXException, IOException{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = factory.newDocumentBuilder();
		Document doc = docBuilder.parse("tmovie.xml");
		doc.getDocumentElement().normalize();
		Element root = doc.getDocumentElement();
		NodeList child = root.getElementsByTagName("movie");
		System.out.println(child.getLength());
		Element el = (Element)child.item(selectNum-1);
		//System.out.println(el.getTextContent());
		
		String brandName = el.getElementsByTagName("brandName").item(0).getFirstChild().getNodeValue();
		
		String info1=el.getElementsByTagName("info1").item(0).getFirstChild().getNodeValue();
		
		String info2=el.getElementsByTagName("info2").item(0).getFirstChild().getNodeValue();
		
		String benefit=el.getElementsByTagName("benefit").item(0).getFirstChild().getNodeValue();
		benefit = benefit.replaceAll("\n", "<br>");

		String note=el.getElementsByTagName("note").item(0).getFirstChild().getNodeValue();
		note = note.replaceAll("\n", "<br>");

		String tel=el.getElementsByTagName("tel").item(0).getFirstChild().getNodeValue();
		tel = tel.replaceAll("\n", "<br>");
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("brandName", brandName);
		map.put("info1",info1);
		map.put("info2",info2);
		map.put("benefit",benefit);
		map.put("note",note);
		map.put("tel",tel);
		map.get("brandName");
	
		return map;
	}

}
