package fd.md.service;

import java.util.List;
import fd.md.domain.Hospital;
import fd.md.domain.Search;
import fd.md.domain.SearchListResult;

public interface SearchService {
	
	List<Hospital> listS();
	SearchListResult getSearchListResult(int cp, int ps);
	SearchListResult getSearchListResult(int cp, int ps, String hosname, String addr);
	//Hospital getBoard(long num);
	//List<Hospital> selectPerPageS(PagingVo pagingVo);
	//long selectCountS();
	List<Search> maplistS(String rstr);

}
