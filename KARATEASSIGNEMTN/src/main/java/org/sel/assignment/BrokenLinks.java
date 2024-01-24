package org.sel.assignment;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class BrokenLinks {
	
	private static String url;

	public static void main(String[] args) {
		ChromeDriver driver = new ChromeDriver();
		driver.get("https://www.amazon.com/");
		List<WebElement> linksAmazon = driver.findElements(By.tagName("a"));
		System.out.println("the number of links available is: " + linksAmazon.size() );
		
		List<String> emptyList = new ArrayList<String>();
		
		for(WebElement findbrokenLinks :linksAmazon) {
			url = findbrokenLinks.getAttribute("href");
			emptyList.add(url);
			//CheckBrokenLinks(url);
			}
		
		long StartTime = System.currentTimeMillis();
		emptyList.parallelStream().forEach(e->CheckBrokenLinks(e));
		long endTime = System.currentTimeMillis();
		System.out.println("Total time taken" + (StartTime - endTime));
		
		driver.quit();		
	}
	public static void CheckBrokenLinks(String validateUrl) {
		
		try {
			URL linkurl = new URL(validateUrl);
			HttpURLConnection conn = (HttpURLConnection) linkurl.openConnection();
			conn.setConnectTimeout(5000);
			conn.connect();			
			
			if(conn.getResponseCode()>=400) {
				System.out.println(linkurl + "--->" + conn.getResponseMessage() + "is a broken link");
			}
			else {
				System.out.println(linkurl + "--->" + conn.getResponseMessage());
			}
			
		}
	catch(Exception e)
			{
		
		}
	
	}
}
