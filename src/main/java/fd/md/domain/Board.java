package fd.md.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
//domain �� �ִ� ������ DTO ����
public class Board {
	private long seq;
	private String writer;
	private String email;
	private String subject;
	private String content;
	private String hosname;
	private int rating;
	private long views;
	private Date rdate;

}


