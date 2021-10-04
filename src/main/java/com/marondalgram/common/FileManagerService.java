package com.marondalgram.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component // 스프링 빈 (bo,dao, controller가 아닌)
public class FileManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
}
