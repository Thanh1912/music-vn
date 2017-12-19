package music.com.vn.dao;
import music.com.vn.dto.Pagination;
import music.com.vn.model.UserEntity;

import java.util.List;

public interface UserDao extends IOperations<UserEntity>{
	public UserEntity findByEmail(String Email);
	public List<UserEntity> findAll(Pagination page);
	public int count();
	public UserEntity LoadById(Long id);
}
