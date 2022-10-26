package fd.md.mapper;

import fd.md.domain.Member;

public interface MemberMapper {

	void signup(Member member);
	void login(Member member);
	//boolean loginok(Member member, HttpSession session);
	Member loginok(Member member);
	void updateok(Member member);
	//void update(Member member);
}
