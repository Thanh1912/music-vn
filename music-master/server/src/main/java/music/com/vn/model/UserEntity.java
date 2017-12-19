package music.com.vn.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
public class UserEntity  implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column
	private Date modifiedAt;

	@Column
	private Date createdAt;

	private String username;

	@Column(unique = true,nullable = false)
	private String email;

	@Column(nullable = false)
	private String password;

	@Column( )
	private String image;

	@OneToMany(fetch = FetchType.LAZY,cascade =
			{
					CascadeType.MERGE,
			})
	@JoinColumn(name = "user_id", foreignKey = @ForeignKey(value = ConstraintMode.NO_CONSTRAINT))
	private List<SongEntity> SongEntities;


	@OneToMany(fetch = FetchType.LAZY,cascade = {
					CascadeType.ALL
	})
	@JoinColumn(name = "user_id", foreignKey = @ForeignKey(value = ConstraintMode.NO_CONSTRAINT))
	private List<UserRoleEntity> UserRoleEntities;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", foreignKey = @ForeignKey(value = ConstraintMode.NO_CONSTRAINT))
	private List<AlbumEntity> AlbumEntities;


	public List<UserRoleEntity> getUserRoleEntities() {
		return UserRoleEntities;
	}

	public void setUserRoleEntities(List<UserRoleEntity> userRoleEntities) {
		UserRoleEntities = userRoleEntities;
	}

	public Date getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
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

	public List<AlbumEntity> getAlbumEntities() {
		return AlbumEntities;
	}

	public void setAlbumEntities(List<AlbumEntity> albumEntities) {
		AlbumEntities = albumEntities;
	}

}
