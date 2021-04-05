package interceptor;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import service.CartService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j
@RequiredArgsConstructor
public class UserInterceptor extends HandlerInterceptorAdapter{

    private final CartService cartService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();

        String userid = (String) session.getAttribute("userid");

        log.info("MemberInterceptor : " + userid);

        if (userid != null) {
            int cartCount = cartService.countCartForMember(userid);
            session.setAttribute("cartCount", cartCount);

            log.info("CartCount : " + cartCount);
        } else {
            session.setAttribute("cartCount", 0);
        }
    }
}
