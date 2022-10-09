package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // @Controller + @ResponseBody
public class Quiz02RestController {
	
	// 요청 URL : http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/lesson01/quiz02/1")
	public List<Map<String, Object>> quiz02_1() {
		// @ResponseBody + return String => HttpMessageConverter String => 글자가 response에 담긴다
		// @ResponseBody + return 객체 => HttpMessageConverter 객체 jackson 라이브러리 => JSON 응답 - API
		
		List<Map<String, Object>> result = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rate", 0);
		map.put("director", "로베르토 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rate", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		result.add(map);

		map = new HashMap<>();
		map.put("rate", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		result.add(map);

		map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		result.add(map);
		
		return result; // [{...}, {...}]
	}
	
	// 요청 URL : http://localhost:8080/lesson01/quiz02/2
	@RequestMapping("/lesson01/quiz02/2")
	public List<Board> quiz02_2() {
		List<Board> boardList = new ArrayList<>();
		
		Board board = new Board(); // 일반 java bean
		board.setTitle("안녕하세요 가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		boardList.add(board);
		
		board = new Board();
		board.setTitle("헐 대박");
		board.setUser("bada");
		board.setContent("오늘 목요일이었어... 금요일인줄");
		boardList.add(board);
		
		board = new Board();
		board.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		board.setUser("dulumary");
		board.setContent("...");
		boardList.add(board);
		
		return boardList;
	}
	
	// 요청 URL : http://localhost:8080/lesson01/quiz02/3
	@RequestMapping("/lesson01/quiz02/3")
	public ResponseEntity<Board> quiz02_3() {
		Board board = new Board(); // 일반 java bean
		board.setTitle("안녕하세요 가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		return new ResponseEntity<>(board, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}