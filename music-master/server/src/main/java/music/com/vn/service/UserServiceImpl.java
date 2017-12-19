package music.com.vn.service;

import music.com.vn.dao.UserDao;
import music.com.vn.dto.CollectionUserDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.UserDTO;
import music.com.vn.exception.BadRequestRuntimeException;
import music.com.vn.model.UserEntity;
import music.com.vn.model.UserRoleEntity;
import music.com.vn.utils.Utils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDAO;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public UserDTO save(UserDTO user,String role) {
		checkInsertData(user);
		UserEntity DtotoEntity = modelMapper.map(user, UserEntity.class);
		Date date = new Date();
		DtotoEntity.setModifiedAt(date);
		DtotoEntity.setCreatedAt(date);
		DtotoEntity.setPassword(passwordEncoder.encode(DtotoEntity.getPassword()));
		DtotoEntity.setImage("user_default.jpg");
		UserRoleEntity userRoleEntity=new UserRoleEntity();
		userRoleEntity.setRole(role);
		List<UserRoleEntity> userRoleEntities=new ArrayList<>();
		userRoleEntities.add(userRoleEntity);
		DtotoEntity.setUserRoleEntities(userRoleEntities);
		Long id = userDAO.create(DtotoEntity);
		UserDTO userDto = modelMapper.map(userDAO.findOne(id), UserDTO.class);
		return userDto;
	}

	@Override
	public UserDTO saveUser(UserDTO user) {
		checkInsertData(user);
		UserEntity DtotoEntity = modelMapper.map(user, UserEntity.class);
		Date date = new Date();
		DtotoEntity.setModifiedAt(date);
		DtotoEntity.setCreatedAt(date);
		DtotoEntity.setPassword(passwordEncoder.encode(DtotoEntity.getPassword()));
		DtotoEntity.setImage("user_default.jpg");
		UserRoleEntity userRoleEntity=new UserRoleEntity();
		List<String> listrole=user.getRoleName();
		listrole.stream().forEach(m->userRoleEntity.setRole(m));
		List<UserRoleEntity> userRoleEntities=new ArrayList<>();
		userRoleEntities.add(userRoleEntity);
		DtotoEntity.setUserRoleEntities(userRoleEntities);
		Long id = userDAO.create(DtotoEntity);
		UserDTO userDto = modelMapper.map(userDAO.findOne(id), UserDTO.class);
		return userDto;
	}

	private void checkInsertData(UserDTO user) {
		if (isDuplicateEmail(user.getEmail())) {
			throw new BadCredentialsException("Email Is Duplicate");
		}
		if(user.getEmail().length()<=0){
			throw new BadCredentialsException("Email Not Null");
		}
		if(user.getPassword().length()<6){
			throw new BadCredentialsException("Password lenght > 6");
		}
	}

	private boolean isDuplicateEmail(String email) {
		if (userDAO.findByEmail(email) != null) {
			return true;
		}
		return false;
	}

	public UserDTO update(UserDTO user) {
		if(isExistUser(user)){
			UserEntity entity = modelMapper.map(user, UserEntity.class);
			SetAllUserEntity(entity);
			UserEntity result = userDAO.update(entity);
			return modelMapper.map(result, UserDTO.class);
		}
		throw new BadRequestRuntimeException("User Not Exist!");
	}

	private void SetAllUserEntity(UserEntity entity) {
		UserEntity originalEngity= userDAO.findOne(entity.getId());
		if(entity.getPassword()!=null&&entity.getPassword().length()>0){
			entity.setPassword(passwordEncoder.encode(entity.getPassword()));
		}
		else{
			entity.setPassword(originalEngity.getPassword());
		}

		String imageUser = entity.getImage();
		if (imageUser != null)
			entity.setImage(Utils.writeOrUpdate("user", imageUser));
		else{
			entity.setImage(originalEngity.getImage());
		}
		Date modifiedAt=new Date();
		entity.setModifiedAt(modifiedAt);
	}

	private boolean isExistUser(UserDTO user) {
		if(userDAO.findOne(user.getId())!=null){
       return true;
		}
		return false;
	}

	public boolean delete(Long id) {
		if (userDAO.findOne(id) == null) {
			return false;
		}
		userDAO.deleteById(id);
		return true;
	}

	public UserDTO findOne(Long id) {
		if (id <= 0) {
			return null;
		}
		UserEntity userentity = userDAO.findOne(id);
		if (userentity == null) {
			return null;
		}
		UserEntity userEntity =userDAO.findOne(id);
		UserDTO userDTO=modelMapper.map(userEntity, UserDTO.class);
		for(UserRoleEntity user1:  userEntity.getUserRoleEntities()){
			List<String> list=new ArrayList<>();
			list.add(user1.getRole());
			userDTO.setRoleName(list);
		}
		return userDTO;
	}

	public CollectionUserDTO findAll(Pagination page) {
		List<UserEntity> listUserEntity = userDAO.findAll(page);
		List<UserDTO> listUserDTO = convertCollectionToDTO(listUserEntity);
		int totalElementUser = userDAO.count();
		page.setTotalElement(totalElementUser);
		return setCollectionDTO(listUserDTO, page);
	}

	private List<UserDTO> convertCollectionToDTO(List<UserEntity> listUserEntity) {

		List<UserDTO> listDTO = new ArrayList<>();
		for (UserEntity userEntity : listUserEntity) {
		   UserDTO userDTO=	modelMapper.map(userEntity, UserDTO.class);
			 for(UserRoleEntity user1:  userEntity.getUserRoleEntities()){
				List<String> list=new ArrayList<>();
				 list.add(user1.getRole());
				 userDTO.setRoleName(list);
			 }
			listDTO.add(userDTO);

		}
		return listDTO;
	}

	private CollectionUserDTO setCollectionDTO(List<UserDTO> list, Pagination page) {
		CollectionUserDTO listcollection = new CollectionUserDTO();
		listcollection.setPage(page);
		listcollection.setListDTo(list);
		return listcollection;

	}

	@Transactional
	public UserDTO findByEmail(String email) {
		UserEntity userEntity = userDAO.findByEmail(email);

		List<String> ListRole = new ArrayList<>();
		List<UserRoleEntity> userRoleEntity = userEntity.getUserRoleEntities();
		for (UserRoleEntity userRole : userRoleEntity) {
			ListRole.add(userRole.getRole());
		}
		UserDTO userdtoResult = modelMapper.map(userEntity, UserDTO.class);
		userdtoResult.setRoleName(ListRole);
		return userdtoResult;
	}


}
