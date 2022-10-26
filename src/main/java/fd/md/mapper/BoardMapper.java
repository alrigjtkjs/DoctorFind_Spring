	package fd.md.mapper;

	import java.util.List;

	import fd.md.domain.Board;

	public interface BoardMapper {
		List<Board> list();
		void insert(Board board);
		void delete(long seq);
		//void content(Board seq);
		Board content(long seq);  //id값 Mapper.xml과 일치시키기?
		void update(Board board);
		void updateView(Board board);
	}

