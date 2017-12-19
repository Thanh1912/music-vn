package music.com.vn.SpringSecurity;

import music.com.vn.dto.UserDTO;
import music.com.vn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service

public class CustomUserDetailsService implements UserDetailsService {
	 @Autowired
	   private UserService userService;

	 @Transactional
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException, DataAccessException {

		UserDTO userDTO = userService.findByEmail(email);
	
		if (userDTO == null) {
			throw new UsernameNotFoundException("User " + email + " not found!");
		}
		System.out.println("Login"+userDTO.getEmail());
		return new UserPrincipal(userDTO);

	}
	
	 
}
