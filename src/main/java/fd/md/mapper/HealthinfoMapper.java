package fd.md.mapper;

import java.util.List;

import fd.md.domain.Healthinfo;

public interface HealthinfoMapper {
	List<Healthinfo> list(int month);
}
