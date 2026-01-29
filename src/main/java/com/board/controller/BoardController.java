package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.board.domain.Board;
import com.board.service.BoardService;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@GetMapping("/insertForm")
	public String boardInsertForm(Model model) {
		return "board/insertForm";
	}

	@PostMapping("/insert")
	public String boardInsert(Board board, Model model) {
		log.info("insert board=" + board.toString());
		try {
			int count = boardService.register(board);
			if (count > 0) {
				model.addAttribute("message", "%s 님의 게시판이 등록되었습니다.".formatted(board.getWriter()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", "%s 님의 게시판이 등록 실패하였습니다.".formatted(board.getWriter()));
		return "board/failed";
	}

	@GetMapping("/boardList")
	public String boardList(Model model) {
		log.info("boardList");
		try {
			List<Board> boardList = boardService.list();
			model.addAttribute("boardList", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "board/boardList";
	}

	@GetMapping("/detail")
	public String boardDetail(Board b, Model model) {
		log.info("boardDetail board=" + b.toString());
		try {
			Board board = boardService.read(b);
			if (board == null) {
				model.addAttribute("message", "%d 번 상세정보가 없습니다.".formatted(board.getNo()));
				return "board/failed";
			}
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/detail";
	}

	@GetMapping("/delete")
	public String boardDelete(Board board, Model model) {
		log.info("boardDelete board=" + board.toString());
		try {
			int count = boardService.remove(board);
			if (count > 0) {
				model.addAttribute("message", "%d 번 게시판이 삭제되었습니다.".formatted(board.getNo()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", "%d 번 게시판을 삭제하는 데 실패하였습니다.".formatted(board.getNo()));
		return "board/failed";
	}

	@GetMapping("/updateForm")
	public String boardUpdateForm(Board b, Model model) {
		log.info("boardUpdateForm board=" + b.toString());
		try {
			Board board = boardService.read(b);
			if (board == null) {
				model.addAttribute("message", "%d 번 정보가 없습니다.".formatted(board.getNo()));
				return "board/failed";
			}
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/updateForm";
	}

	@PostMapping("/update")
	public String boardUpdate(Board b, Model model) {
		log.info("boardUpdate board=" + b.toString());
		try {
			int count = boardService.modify(b);
			if (count > 0) {
				model.addAttribute("message", "%s 님의 게시판이 수정되었습니다.".formatted(b.getWriter()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", "%s 님의 게시판을 수정하는 데 실패하였습니다.".formatted(b.getWriter()));
		return "board/failed";
	}

	@GetMapping("/search")
	public String boardSearch(String searchType, String keyword, Model model) {
		log.info("boardSearch searchType= %s keyword= %s".formatted(searchType, keyword));
		try {
			List<Board> boardList = boardService.search(searchType, keyword);
			model.addAttribute("boardList", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "board/boardList";
	}
}
