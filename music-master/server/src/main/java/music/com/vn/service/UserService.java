package music.com.vn.service;

import music.com.vn.dto.CollectionUserDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.UserDTO;
import org.springframework.security.access.prepost.PreAuthorize;

public interface UserService {
	public UserDTO save(UserDTO user,String role);

	public UserDTO saveUser(UserDTO user);

	public UserDTO update(UserDTO user);

	public boolean delete(Long id);

	public UserDTO findOne(Long id);

	@PreAuthorize("hasRole('ROLE_ROOTMANAGER')")
	public CollectionUserDTO findAll(Pagination page) ;
	
	public UserDTO findByEmail(String email);

}
