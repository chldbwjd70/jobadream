package edu.kh.job.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.kh.job.member.model.service.MemberService;

@RestController
public class SNSController {
	
	@Autowired
	private MemberService service;
	
	//휴대폰 인증
	@RequestMapping(value="sendSMS",method=RequestMethod.POST)
	public String sendSMS(@RequestParam("memberPhone") String memberPhone) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + memberPhone);
        System.out.println("인증번호 : " + numStr);
        
        service.certifiedPhoneNumber(memberPhone,numStr);
        
        return numStr;
    }
	

}
