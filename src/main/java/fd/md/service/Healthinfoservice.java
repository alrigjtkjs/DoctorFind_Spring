package fd.md.service;

import java.util.List;

import fd.md.domain.Healthinfo;

public interface Healthinfoservice {
	List<Healthinfo> listS(int month);
}
