package fd.md.mapper;

import java.util.List;
import fd.md.domain.Hospital;
import fd.md.domain.PagingVo;
import fd.md.domain.Search;

public interface SearchMapper {
	
	List<Hospital> list();
	List<Hospital> selectPerPage(PagingVo pagingVo);
	long selectCount();
	/* °Ë»ö */
	List<Hospital> selectNameAddr(PagingVo pagingVo);
	long selectCountByNameAddr(PagingVo pagingVo);
	
	List<Search> maplist(String rstr);
}
