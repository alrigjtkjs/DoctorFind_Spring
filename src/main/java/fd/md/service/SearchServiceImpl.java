package fd.md.service;

import java.util.List;

import org.springframework.stereotype.Service;

import fd.md.domain.Hospital;
import fd.md.domain.PagingVo;
import fd.md.domain.Search;
import fd.md.domain.SearchListResult;
import fd.md.mapper.SearchMapper;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class SearchServiceImpl implements SearchService {
	private SearchMapper searchMapper;

	@Override
	public List<Hospital> listS() {
		return searchMapper.list();
	}
	@Override
	public SearchListResult getSearchListResult(int cp, int ps) {
		long totalCount = searchMapper.selectCount();
		PagingVo pagingVo = new PagingVo(cp,ps);
		List<Hospital> list = searchMapper.selectPerPage(pagingVo);
		
		return new SearchListResult(cp,totalCount,ps,list);
	}
	@Override
	public SearchListResult getSearchListResult(int cp, int ps, String hosname, String addr) {
		PagingVo pagingVo = new PagingVo(cp,ps,hosname,addr);
		long totalCount = searchMapper.selectCountByNameAddr(pagingVo);
		List<Hospital> list = searchMapper.selectNameAddr(pagingVo);
		
		return new SearchListResult(cp,totalCount,ps,list);
	}
	@Override
	public List<Search> maplistS(String rstr) {	
		return searchMapper.maplist(rstr);
	}
}
