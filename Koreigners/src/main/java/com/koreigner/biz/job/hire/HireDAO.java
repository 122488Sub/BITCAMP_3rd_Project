package com.koreigner.biz.job.hire;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HireDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	
}
