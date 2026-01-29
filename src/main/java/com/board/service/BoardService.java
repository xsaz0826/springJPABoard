package com.board.service;

import java.util.List;

import com.board.domain.Board;

public interface BoardService {
	public int register(Board board) throws Exception;
	public Board read(Board board) throws Exception;
	public int modify(Board board) throws Exception;
	public int remove(Board board) throws Exception;
	public List<Board> list() throws Exception;
	public List<Board> search(String searchType, String keyword) throws Exception;
}
