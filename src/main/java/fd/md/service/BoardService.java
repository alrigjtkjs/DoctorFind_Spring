package fd.md.service;

import java.util.List;

import fd.md.domain.Board;

public interface BoardService {
	List<Board> listS();
	void insertS(Board board);
	void deleteS(long seq);
	Board contentS(long seq);
	void updateS(Board board);
	void updateViewS(Board board);
	
}