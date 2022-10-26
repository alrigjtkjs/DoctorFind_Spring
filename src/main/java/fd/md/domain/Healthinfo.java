package fd.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Healthinfo {
	private int id;
	private int month;
	private String subject;
	private String content;
}
