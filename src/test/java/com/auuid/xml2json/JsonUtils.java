package com.auuid.xml2json;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.junit.Test;

public class JsonUtils {

	public static String xml2jsonString(String xml) throws JSONException {

		JSONObject xmlJSONObj = XML.toJSONObject(xml);

		return xmlJSONObj.toString();

	}

	@Test
	public void testJson() throws Exception{
		File file = new File("/Users/bradyhan/git/allInOne/src/test/java/com/auuid/xml2json/data");
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		StringBuilder sb = new StringBuilder();
		String str = "";
		while(str != null) {
			str = br.readLine();
			sb.append(str);
		}
		JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	}
}