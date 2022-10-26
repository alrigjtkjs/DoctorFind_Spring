package fd.md.domain;

import java.util.List;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class SearchListResult {
	private List<Hospital> list;
	private int cp;
	private int ps;
	private long totalCount;
	private long totalPageCount;
	
	public SearchListResult(int cp, long totalCount, int ps, List<Hospital> list) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	private long calTotalPageCount() {
		long tpc = totalCount/ps;
		if(totalCount%ps != 0) tpc++;
		
		return tpc;
	}
}
