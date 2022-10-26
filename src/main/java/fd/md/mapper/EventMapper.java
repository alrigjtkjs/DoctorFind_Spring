package fd.md.mapper;

import java.util.List;

import fd.md.domain.Event;

public interface EventMapper {
	List<Event> list();
	List<Event> content(int seq);
}
