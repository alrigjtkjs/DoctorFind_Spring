package fd.md.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fd.md.domain.Board;
import fd.md.mapper.BoardMapper;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{

	private BoardMapper boardMapper;
	
	@Override
	public List<Board> listS(){
		return boardMapper.list();
	}
	@Override
	public void insertS(Board board) {
		boardMapper.insert(board);
	}
	@Override
	public void deleteS(long seq) {
		boardMapper.delete(seq);
	}
	@Override
	public Board contentS(long seq) {
		return boardMapper.content(seq);
	}
	@Override
	public void updateS(Board board) {
		boardMapper.update(board);
	}
	@Override
	public void updateViewS(Board board) {
		boardMapper.updateView(board);
	}
}






