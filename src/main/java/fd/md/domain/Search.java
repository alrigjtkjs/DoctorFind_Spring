package fd.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Search {
	private String hosname;
	private String addr;
	private float xpoint;
	private float ypoint;
}
