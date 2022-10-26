package fd.md.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fd.md.domain.Event;
import fd.md.mapper.EventMapper;

@Service
public class EventserviceImpl implements Eventservice {
	@Autowired
	private EventMapper mapper;
	@Override
	public List<Event> listS() {
		return mapper.list();
	}

	@Override
	public List<Event> contentS(int seq) {
		return mapper.content(seq);
	}

}
