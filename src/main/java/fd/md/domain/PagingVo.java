package fd.md.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class PagingVo {
	private int cp = 1; 
	private int ps = 15;
	
	public int getStartRow() {
		return (cp-1)*ps;
	}
	public int getEndRow() {
		return cp*ps;
	}
	public PagingVo(int cp, int ps) {
		this.cp = cp;
		this.ps = ps;
	}
	
	String hosname;
	String addr;
	public String getHosname() {
		return hosname;
	}
	public String getAddr() {
		return addr;
	}
}