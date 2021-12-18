package com.example.demo.controller;

import java.io.File;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.Tts;

@Controller
public class OpenApiController {
	
	@Autowired
	Tts tts;

	@RequestMapping("tts")
	@ResponseBody
	public String tts(String text) {
		String name =tts.convertToSoundFileName(text);
		return name;
	}

}
