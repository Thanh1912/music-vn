package music.com.vn.dto;

import java.util.List;

public class SongDTO extends Pagination {
	private Long id;

	private String username;

	private String email;

	private String password;

	private String image;

	private List<String> RoleName;

	public List<String> getRoleName() {
		return RoleName;
	}

	public void setRoleName(List<String> roleName) {
		RoleName = roleName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
