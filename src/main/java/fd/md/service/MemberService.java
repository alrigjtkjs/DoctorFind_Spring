package fd.md.service;

import fd.md.domain.Member;

public interface MemberService {
	void signupS(Member member);
	void loginS(Member member);
	//public boolean loginokS(Member member, HttpSession session);
	Member loginokS(Member member);
	void updateokS(Member member);
}
