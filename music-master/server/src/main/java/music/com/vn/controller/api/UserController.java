package music.com.vn.controller.api;

import music.com.vn.dto.CollectionUserDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.UserDTO;
import music.com.vn.exception.BadRequestRuntimeException;
import music.com.vn.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController

public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	UserService userservice;
	/*@GetMapping("/api/me")
	public UserDTO user() {
		if (SecurityUtils.isAuthenticated()) {
			String email = SecurityUtils.getCurrentUserLogin();
			UserDTO user=new UserDTO();
			if(email!="anonymousUser")
			 user = userservice.findByEmail(email);
			return user;
		}
		throw new BadCredentialsException("Invalid username or password provided");
	}*/

	@RequestMapping(value = "/api/username", method = RequestMethod.GET)
	@ResponseBody
	//@PreAuthorize("hasRole('user')")
	public String currentUserName(Authentication authentication) {
		return authentication.getName();
	}

	@PostMapping("/apitest/register")
	public ResponseEntity<UserDTO> register(@RequestBody UserDTO user) {
		UserDTO userdto = userservice.save(user,"user");
		return ResponseEntity.ok(userdto);
	}
	//@PreAuthorize("hasAnyRole('user','admin','Manager')")
	@PostMapping("/apitest/user")
	public ResponseEntity<UserDTO> createCustomer(@RequestBody UserDTO user) {
		UserDTO userdto = userservice.saveUser(user);
		return ResponseEntity.ok(userdto);
	}
	@GetMapping("/apitest/user/{id}")
	public ResponseEntity<UserDTO> get(@PathVariable("id") Long id) {
		UserDTO userdto = userservice.findOne(id);
		if (userdto == null) {
			return new ResponseEntity<UserDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(userdto);
	}

	@GetMapping("/root/api/user")
	public ResponseEntity<CollectionUserDTO> getallPage(
			@RequestParam(name = "size", defaultValue = "10") int recordPerPage,
			@RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page = new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		CollectionUserDTO userdto = userservice.findAll(page);
		if (userdto == null) {
			return new ResponseEntity<CollectionUserDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(userdto);
	}

	@SuppressWarnings("rawtypes")
	@DeleteMapping("/apitest/user/{id}")
	public ResponseEntity delete(@PathVariable Long id) {
		if (userservice.delete(id) == false) {
			return new ResponseEntity<UserDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(id);

	}
//	@PreAuthorize("hasAnyRole('user','admin','Manager')")
	@PutMapping(value = "/apitest/user/{id}")
	public ResponseEntity<UserDTO> update(@PathVariable Long id,@RequestBody UserDTO userdto) {
		if (null == userdto) {
			throw new BadRequestRuntimeException("Invalid Email ");
		}
		userdto.setId(id);
		userdto = userservice.update(userdto);
		System.out.print(userdto.getId());
		System.out.print(userdto.getUsername());
		return ResponseEntity.ok(userdto);
	}

}
