package fd.md.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Hospital {
	private long num;
	private String hosname;
	private String code;
	private String addr;
	private String tel;
	private String url;
	private Date odate;
	private int doctors;
	private int xpoint;
	private int ypoint;
	private String emgday;
	private String emgnight;
	private String sunDoff;
	private String holyoff;
	private String subject;
	private String mon;
	private String tue;
	private String wed;
	private String thur;
	private String fri;
	private String sat;
}
