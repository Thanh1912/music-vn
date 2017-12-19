package music.com.vn.SpringSecurity;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import music.com.vn.dto.UserDTO;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class UserPrincipal implements UserDetails {

	private static final long serialVersionUID = -3577828472373175032L;
	private UserDTO user;

	public UserDTO getUser() {
		return user;
	}

	public UserPrincipal(UserDTO user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		System.out.println(user.getRoleName().size());
		System.out.println(user.getRoleName().get(0));
		for(int i=0;i<user.getRoleName().size();i++){
			authorities.add(new SimpleGrantedAuthority(user.getRoleName().get(i)));
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		}
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return true;
	}
}

