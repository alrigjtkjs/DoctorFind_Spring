package fd.md.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Book {
	private long seq;
	private String name;
	private String email;
	private String hosname;
	private String symptom;
	private String content;
	private String bdate;
	private String btime;
}


