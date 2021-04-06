package security;

import domain.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

import mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import security.domain.CustomUser;

import javax.servlet.http.HttpServletRequest;

@Log4j
@RequiredArgsConstructor
public class  CustomUserDetailsService implements UserDetailsService {

    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

        log.warn("Load User By UserName : " + userName);

        // userName means userid
        MemberVO vo = memberMapper.get(userName);

        log.warn("queried by member mapper : " + vo);

        return vo == null ? null : new CustomUser(vo);
    }
}
