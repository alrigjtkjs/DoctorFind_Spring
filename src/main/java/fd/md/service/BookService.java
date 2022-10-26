package fd.md.service;

import java.util.List;
import fd.md.domain.Book;

public interface BookService {
	List<Book> listS(String email);
	void insertS(Book board);
	void deleteS(long seq);
}