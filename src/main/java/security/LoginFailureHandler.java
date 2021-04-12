package security;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Getter
@Setter
public class LoginFailureHandler implements AuthenticationFailureHandler {

    private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;


    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException exception) throws IOException, ServletException {

        String userid = httpServletRequest.getParameter(loginidname);
        String userpw = httpServletRequest.getParameter(loginpwdname);
        String errormsg = null;
        defaultFailureUrl = "/member/loginForm?error";

        if (exception instanceof InternalAuthenticationServiceException) {
            errormsg = "1"; // 비밀번호를 잘못 입력했습니다.
        } else if (exception instanceof BadCredentialsException) {
            errormsg = "2";
        }

        httpServletRequest.setAttribute("userid", userid);
        httpServletRequest.setAttribute("userpw", userpw);
        httpServletRequest.setAttribute(errormsgname, errormsg);

        httpServletRequest.getRequestDispatcher(this.defaultFailureUrl).forward(httpServletRequest, httpServletResponse);
    }
}
