package music.com.vn.controller.api;

import music.com.vn.dto.UserDTO;
import music.com.vn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

@RestController
public class UserOAuth02 {
    @Autowired
    UserService userservice;
   // @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping("/api/userinfo")
    public ResponseEntity<?> userinfo() {
        OAuth2Authentication oAuth2Authentication =
                (OAuth2Authentication) SecurityContextHolder.getContext().getAuthentication();

        Authentication userAuthentication = oAuth2Authentication.getUserAuthentication();
        return ResponseEntity.ok(userAuthentication);
    }
    @RequestMapping("/api/me")
    public User me(@AuthenticationPrincipal User activeUser) {
        return activeUser;
    }
    @RequestMapping(value = "/api/tt")
    public String index(Principal principal) {
        System.out.println(principal);
        // org.springframework.security.oauth2.provider.OAuth2Authentication@c2e723e8: Principal: superadmin; Credentials: [PROTECTED]; Authenticated: true; Details: remoteAddress=<ADDRESS>, sessionId=<SESSION>, tokenType=bearertokenValue=<TOKEN>; Granted Authorities: {userRoleID=1, authority=ROLE_SUPERUSER}
        OAuth2Authentication auth = (OAuth2Authentication) principal;
        System.out.println(auth.getUserAuthentication().getDetails());
        // {userID=1, username=superadmin, password=***, fullName=SuperUser, email=superadmin@example.org, avatar=null, enabled=true ...
        return "index";
    }
  @RequestMapping("/api/info-user-logined")
    public Map<String, String> user(Principal principal) {

        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            System.out.println("details = " + details);  // id, email, name, link etc.
            Map<String, String> map = new LinkedHashMap<>();
            UserDTO allInfoLogined= userservice.findByEmail( details.get("username"));
            map.put("username", allInfoLogined.getUsername());
            map.put("email", allInfoLogined.getEmail());
            map.put("image",    allInfoLogined.getImage());
            map.put("id", allInfoLogined.getId()+"");
            allInfoLogined.getRoleName().stream().forEach(role->
                    map.put("rolename", role)
            );
            return map;
        }
        return null;
    }

	/*@GetMapping(value = "/api/info-user-logineds")
 	public Map<String, String> currentUserNameSimple(HttpServletRequest request) {
        Principal principal = request.get();
        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            return map;
        }
        		return null;
       	}
*/
}
