package fd.md.service;

import org.springframework.stereotype.Service;

import fd.md.domain.Member;
import fd.md.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	private MemberMapper memberMapper;
	
	@Override
	public void signupS(Member member) {
		memberMapper.signup(member);
	}
	@Override
	public void loginS(Member member) {
		memberMapper.login(member);
	}
	@Override
	public Member loginokS(Member member) {
		return memberMapper.loginok(member);
	}
	@Override
	public void updateokS(Member member) {
		memberMapper.updateok(member);
	}
	
}
