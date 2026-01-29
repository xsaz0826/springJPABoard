package com.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.board.domain.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {

	List<Board> findByContentContaining(String keyword);

	List<Board> findByWriterContaining(String keyword);

	List<Board> findByTitleContaining(String keyword);

}