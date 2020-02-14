package com.uwl.service.weather;


public interface WeatherService {

	public void getWeatherX(String region) throws Exception;
	
	
	//오류방지...수정해야함
	public void getWeather(String string) throws Exception;
}
