package com.koreigner.biz.common;

import java.util.List;
import java.util.Map;

public interface HomeService {

	List<Map<String, Object>> getRecentPosts();

	List<Map<String, Object>> getCountPosts();

}
