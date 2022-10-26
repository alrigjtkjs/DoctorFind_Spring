package fd.md.service;

import java.util.List;
import org.springframework.stereotype.Service;
import fd.md.domain.Book;
import fd.md.mapper.BookMapper;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BookServiceImpl implements BookService{
	private BookMapper bookMapper;
	
	@Override
	public List<Book> listS(String email){
		return bookMapper.list(email);
	}
	@Override
	public void insertS(Book book) {
		bookMapper.insert(book);
	}
	@Override
	public void deleteS(long seq) {
		bookMapper.delete(seq);
	}
}






