package com.uwl.service.weather.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.uwl.service.weather.WeatherService;

import java.util.Date;
import java.util.Locale;
import java.net.URL;
import java.text.SimpleDateFormat;

import sun.net.www.protocol.http.HttpURLConnection;


@Service
public class WeatherXServiceImpl implements WeatherService {
	
	@Value("#{apiProperties['weatherKey']}")
	String weatherKey;

	//오류방지...수정해야함
	@Override
	public void getWeatherX(String region) throws Exception {
	}
	//오류방지...수정해야함
	
	
	public WeatherXServiceImpl() {
		super();
	}

	@Override
	public void getWeather(String region) throws Exception {
	
		System.out.println("!!!!!!!!!!!!!!!!!!!! WeatherXServiceImpl.java");
		System.out.println("region : " + region);
		
		
		// 3일 후 날씨의 지역 코드
//		if( region.contains("서울") | region.contains("경기도") | region.contains("인천")) {
//			region = "11B00000";
//		}else if(region.contains("영서")) {
//			region = "11D10000";
//		}else if(region.contains("영동")) {
//			region = "11D20000";
//		}else if(region.contains("대전") | region.contains("세종") | region.contains("충남")) {
//			region = "11C20000";
//		}else if(region.contains("충북")) {
//			region = "11C10000";
//		}else if(region.contains("전남") | region.contains("광주")) {
//			region = "11F20000";	
//		}else if(region.contains("전북")) {
//			region = "11F10000";
//		}else if(region.contains("경북") | region.contains("대구")) {
//			region = "11H10000";
//		}else if(region.contains("경남") | region.contains("울산") | region.contains("부산")) {
//			region = "11H20000";
//		}else if(region.contains("제주도")) {
//			region = "11G00000";
//		}
		
		
		// 오늘 날씨의 지역 코드
		if (region.contains("서울") | region.contains("경기도") | region.contains("인천")) {
			region = "109";
		} else if (region.contains("전국")) {
			region = "108";
		} else if (region.contains("강원도")) {
			region = "105";
		} else if (region.contains("대전") | region.contains("세종") | region.contains("충남")) {
			region = "133";
		} else if (region.contains("충북")) {
			region = "131";
		} else if (region.contains("전남") | region.contains("광주")) {
			region = "156";
		} else if (region.contains("전북")) {
			region = "146";
		} else if (region.contains("경북") | region.contains("대구")) {
			region = "143";
		} else if (region.contains("경남") | region.contains("울산") | region.contains("부산")) {
			region = "159";
		} else if (region.contains("제주도")) {
			region = "184";
		}
		
		
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
			
			// 3일 후 날씨 url
//					String url = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather?serviceKey="+weatherKey+"&regId="+region+"&tmFc="+date+to+"00&numOfRows=10&pageNo=1&_type=json";
			
			// 오늘 날씨 url
			String url = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleForecast?serviceKey="+weatherKey+"&stnId="+region+"&tmFc="+date+to+"00&numOfRows=10&pageNo=1&_type=json";
			
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));

			JSONObject json = (JSONObject)JSONValue.parse(in);
			System.out.println(json);
			
			
			
//			String inputLine;
//			StringBuffer response = new StringBuffer();
//			
//			while ((inputLine = in.readLine()) != null){
//				System.out.println(inputLine);
//				response.append(inputLine);
//			}
//			in.close();
			
		} catch (Exception e) {
	        System.out.println(e);
		}System.out.println("\n");
	}

	
}
