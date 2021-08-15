package edu.kh.job.gps.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.job.board.model.vo.Board;
import edu.kh.job.gps.model.service.GpsService;


@Controller
@RequestMapping("/gps/*")
public class GpsController {
	
	@Autowired
	private GpsService service;
	
	// 내주변job 페이지 이동
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String showSearch() {
		return "gps/search";
	}
	
	@RequestMapping(value = "searchView", method = RequestMethod.POST)
	public String showList(@RequestParam("searchGps") String searchGps, Model model) {
		model.addAttribute("searchGps", searchGps);
		System.out.println(searchGps);
		return "gps/gpsList";
	}
	
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public String selectSearchList(@RequestParam("searchGps") String searchGps, Model model) {
		// '구'라는 단어가 어디에 있는지 확인
		int end = searchGps.indexOf("구");
		
		// '구' 다음으로 나오는 주소들은 다 자름
		String subSearch = searchGps.substring(0 , end+1);
		
		// 서울시 동대문구 -> 공백으로 구를 추출
		String[] gList = subSearch.split(" ");

		//int index = searchGps.indexOf(" ");
		//System.out.println("index"+index);
		//String searchGu = searchGps.substring(index+1);
		//System.out.println("ad"+searchGu);
		
		 //int guIndex = ad.indexOf("구 "); System.out.println("guIndex"+ guIndex);
		  //String gu = ad.substring(0,guIndex+1); System.out.println("gu"+gu);
		 
		
		
		String searchGu = gList[1];
		  
		 System.out.println(searchGu);
		  
		 List<Board> sList = service.selectList(searchGu);
		  
		 String[] addrList = null; 
		 for(int i=0; i<sList.size();i++){ 
			addrList = sList.get(i).getBoardPlace().split(",");
		 	sList.get(i).setBoardPlace(addrList[1]); 
		 }
		  
		 System.out.println("테스트"+sList); 
		 Gson gson = new Gson(); 
		 return gson.toJson(sList);

	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String currentList(Model model) {
		String searchGps = "current";
		model.addAttribute("searchGps", searchGps);
		return "gps/gpsList";
	}
	
	
	

}
