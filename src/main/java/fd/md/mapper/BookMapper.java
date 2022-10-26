package fd.md.mapper;

import java.util.List;
import fd.md.domain.Book;

	public interface BookMapper {
		List<Book> list(String email);
		void insert(Book book);
		void delete(long seq);
	}

