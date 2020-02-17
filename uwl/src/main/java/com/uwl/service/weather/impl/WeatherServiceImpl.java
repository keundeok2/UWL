package com.uwl.service.weather.impl;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;

import com.uwl.service.weather.WeatherService;

import java.io.BufferedReader;

public class WeatherServiceImpl implements WeatherService {
	
	@Value("#{apiProperties['weatherKey']}")
	String weatherKey;

	
	// 오류방지.. 수정해야함
	@Override
	public void getWeatherX(String region) throws Exception {
	}
	//오류방지...수정해야함
	
	public WeatherServiceImpl() {
		super();
	}

	@Override
	public void getWeather(String region) throws Exception {
		
//		String date = "20200214";
//		String to = "1700";
		String x = "60";
		String y = "127";
	
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "serviceKey"); /*Service Key*/
        urlBuilder.append("=" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + weatherKey);
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode("date", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("time", "UTF-8")); /*05시 발표*/
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("x", "UTF-8")); /*예보지점 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("y", "UTF-8")); /*예보지점의 Y 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
        
        
        
        SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-ddHH", Locale.KOREA );

		Date currentTime = new Date ();

		String mTime = mSimpleDateFormat.format ( currentTime );
		System.out.println ( mTime );
		
		String time = mTime.replaceAll("-","");
		System.out.println(time);
		
		String date = time.substring( 0,8 ) ;
		
		String result = time.substring(time.length()-2, time.length());
		System.out.println(result);
		
		String to = result;
		
		if(Integer.parseInt(to) >= 06 && Integer.parseInt(to) < 18) {
			to = "06";
			System.out.println("06 = "+to);
		}else {
			to="18";
			System.out.println("18 = "+to);
		}
		System.out.println("지역 = "+region+"\n날짜 = "+date+"\n시간 = "+to+"00");
		
		try {
			
			String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst" + 
					"?serviceKey=" + weatherKey+
					"&numOfRows=10&pageNo=1&base_date=" + date+"&base_time=" + to +"&nx=" + x +"&ny="+ y +"&_type=json";
			
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));

			JSONObject json = (JSONObject)JSONValue.parse(in);
			System.out.println(json);
			
			
		} catch (Exception e) {
	        System.out.println(e);
		}System.out.println("\n");
	}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        URL url = new URL(urlBuilder.toString());
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("GET");
//        conn.setRequestProperty("Content-type", "application/json");
//        System.out.println("Response code: " + conn.getResponseCode());
//        BufferedReader rd;
//        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//        } else {
//            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//        }
//        StringBuilder sb = new StringBuilder();
//        String line;
//        while ((line = rd.readLine()) != null) {
//            sb.append(line);
//        }
//		
//        rd.close();
//        conn.disconnect();
//        System.out.println(sb.toString());
//    }
}
