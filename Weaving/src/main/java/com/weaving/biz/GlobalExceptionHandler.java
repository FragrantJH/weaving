package com.weaving.biz;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(value= {Exception.class})
	public ModelAndView error500Page(Exception ex) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorCode", ex.getClass().getCanonicalName());
		mv.setViewName("empty/error");
		return mv;
	}
}
