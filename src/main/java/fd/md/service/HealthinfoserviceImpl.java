package fd.md.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fd.md.domain.Healthinfo;
import fd.md.mapper.HealthinfoMapper;

@Service
public class HealthinfoserviceImpl implements Healthinfoservice {
	@Autowired
	private HealthinfoMapper healthinfomapper;
	@Override
	public List<Healthinfo> listS(int month) {
		return healthinfomapper.list(month);
	}

}
