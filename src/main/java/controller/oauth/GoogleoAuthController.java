package controller.oauth;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import security.oauth.GoogleOAuthRequest;

@Controller
@Log4j
public class GoogleoAuthController {

    final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
    final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
    final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";

    @Value("${api.client_id}")
    String clientId;
    @Value("${api.client_secret}")
    String clientSecret;

    @GetMapping("/login/google/auth")
    public String googleAuth(Model model, @RequestParam(value = "code") String authCode) throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();

        //Google OAuth Access Token 요청을 위한 파라미터 세팅
        GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
                .builder()
                .clientId(clientId)
                .clientSecret(clientSecret)
                .code(authCode)
                .redirectUri("http://localhost:8080/login/google/auth")
                .grantType("authorization_code").build();

        return "";
    }
}
