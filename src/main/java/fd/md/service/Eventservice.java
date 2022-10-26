package fd.md.service;

import java.util.List;

import fd.md.domain.Event;

public interface Eventservice {
	List<Event> listS();
	List<Event> contentS(int seq);
}
