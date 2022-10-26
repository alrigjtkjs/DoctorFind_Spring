package fd.md.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
	private int seq;
	private String hospital_name;
	private String event_name;
	private Date rdate;
	private String img_address;
	private String content;
}
